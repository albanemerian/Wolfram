{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- ParsingTest
-}

module ParsingTest where

import Parse (parseRules, parsAg, parseArguments)
import Test.Hspec
import System.IO.Silently (capture_)
import System.Exit (ExitCode(..))
import Control.Exception (evaluate)

parseRulesTest :: Spec
parseRulesTest = describe "parseRules" $ do
  it "parses rule 30" $ do
    parseRules ["--rule", "30"] `shouldBe` [30]
  it "parses rule 90" $ do
    parseRules ["--rule", "90"] `shouldBe` [90]
  it "parses rule 110" $ do
    parseRules ["--rule", "110"] `shouldBe` [110]
  it "returns empty list for invalid rule" $ do
    parseRules ["--rule", "invalid"] `shouldBe` []
  it "returns empty list if no rule is provided" $ do
    parseRules [] `shouldBe` []
  it "searches if rule isn't first" $ do
    parseRules ["--lines", "10", "--rule", "30"] `shouldBe` [30]

parsAgTest :: Spec
parsAgTest = describe "parsAg" $ do
  it "parses valid arguments" $ do
    parsAg ["--lines", "10", "--start", "5"] `shouldReturn` [("--lines", 10), ("--start", 5)]
  it "exits with error for invalid arguments" $ do
    (capture_ $ parsAg ["--lines", "invalid", "--start", "5"]) `shouldThrow` anyException
  it "exits with error for flags without values" $ do
    (capture_ $ parsAg ["--lines", "--start", "5"]) `shouldThrow` anyException
  it "exits with error for missing values" $ do
    (capture_ $ parsAg ["--rule", "30", "--start", "30", "--move"]) `shouldThrow` anyException
  it "allows negative values for move flag" $ do
    parsAg ["--move", "-2"] `shouldReturn` [("--move", -2)]

parseArgumentsTest :: Spec
parseArgumentsTest = describe "parseArguments" $ do
  it "parses all arguments correctly" $ do
    parseArguments ["--rule", "30", "--lines", "10", "--start", "5", "--window", "100", "--move", "2"]
      `shouldReturn` (Just 30, True, False, False, 10, 5, 100, 2)
  it "handles missing optional arguments" $ do
    parseArguments ["--rule", "90"]
      `shouldReturn` (Just 90, False, True, False, -1, 0, 80, 0)
  it "handles invalid rule" $ do
    parseArguments ["--rule", "invalid"]
      `shouldThrow` anyException

main :: IO ()
main = hspec $ do
  parseRulesTest
  parsAgTest
  parseArgumentsTest
