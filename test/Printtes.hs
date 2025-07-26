{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- printtes
-}

module Printtes where
import Print (printState)
import Test.Hspec
import System.IO.Silently (capture_)
import System.Exit (ExitCode(..))
import Control.Exception (evaluate)

printStateTest :: Spec
printStateTest = describe "printState" $ do
  it "prints the correct state for a given window and state" $ do
    let window = 5
        state = [0, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = " **  \n"
    output <- capture_ $ printState window state
    output `shouldBe` expectedOutput
  it "prints the correct state for a given window and state" $ do
    let window = 4
        state = [1, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = " ** \n"
    output <- capture_ $ printState window state
    output `shouldBe` expectedOutput
