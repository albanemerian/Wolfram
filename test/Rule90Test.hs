{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- Rule90Test
-}

module Rule90Test where
import Test.Hspec
import Rules90 (rule90)

rule90Test :: Spec
rule90Test = describe "rule90" $ do
  it "returns the correct state for a given state" $ do
    let state = [0, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = [0,1,0,0,1,1,1,1,0,1,0]
    rule90 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 1, 0, 1, 1, 0, 0, 1, 0]
        expectedOutput = [0,1,1,0,1,1,1,1,0,1,0]
    rule90 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 0, 1, 1, 1, 1, 1, 1, 0]
        expectedOutput = [0,0,0,1,0,0,0,0,1,1,0]
    rule90 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 1, 1, 0, 0, 0, 0, 0, 1]
        expectedOutput = [0,1,0,1,1,0,0,0,1,0,0]
    rule90 state `shouldBe` expectedOutput
  it "returns the correct state for a given state" $ do
    let state = [1, 0, 0, 1, 1, 1, 1, 1, 1]
        expectedOutput = [0,0,1,1,1,0,0,0,0,1,0]
    rule90 state `shouldBe` expectedOutput
