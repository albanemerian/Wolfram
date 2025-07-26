{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- rules.90
-}

module Rules90 (rule90) where

import Data.Bits (xor, (.|.), (.&.))

rule90 :: [Int] -> [Int]
rule90 current = [0] ++ [rule90Cell (get current (i - 1))
    (current !! i) (get current (i + 1)) | i <-
    [0..(length current - 1)]] ++ [0]
  where
    get lst idx
      | idx < 0 = 0
      | idx >= length lst = 0
      | otherwise = lst !! idx

rule90Cell :: Int -> Int -> Int -> Int
rule90Cell p _ r = p `xor` r
