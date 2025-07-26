{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- rule30
-}

module Rule30Test where

import Test.Hspec
import Rules30 (rule30)

rule30Test :: Spec
rule30Test = describe "rule30" $ do
  it "returns the correct state for a given state" $ do
    let state = [0, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = [0,1,1,0,1,0,1,1,1,1,0]
    rule30 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = [0,1,0,0,1,0,1,1,1,1,0]
    rule30 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 0, 1, 1, 1, 1, 1, 1, 0]
        expectedOutput = [0,1,0,1,0,0,0,0,0,1,0]
    rule30 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 1, 1, 0, 0, 0, 0, 0, 1]
        expectedOutput = [0,1,0,0,1,0,0,0,1,1,0]
    rule30 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 0, 0, 1, 1, 1, 1, 1, 1]
        expectedOutput = [0,1,1,1,1,0,0,0,0,0,0]
    rule30 state `shouldBe` expectedOutput
