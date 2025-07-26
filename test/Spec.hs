{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- Spec
-}

import Printtes (printStateTest)
import ParsingTest (parseRulesTest, parsAgTest, parseArgumentsTest)
import Rule30Test (rule30Test)
import Rule90Test (rule90Test)

import Test.Hspec
import System.IO.Silently (capture_)
import System.Exit (ExitCode(..))
import Control.Exception (evaluate)




main :: IO ()
main = hspec $ do
  parseRulesTest
  parsAgTest
  parseArgumentsTest
  printStateTest
  rule30Test
  rule90Test
