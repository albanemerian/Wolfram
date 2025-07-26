{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- Rules30
-}

module Rules30 (rule30) where

import Data.Bits (xor, (.|.), (.&.))


rule30 :: [Int] -> [Int]
rule30 current = [0] ++ [rule30Cell (get current (i - 1))
    (current !! i) (get current (i + 1)) | i <-
    [0..(length current - 1)]] ++ [0]
  where
    get lst idx
      | idx < 0 = 0
      | idx >= length lst = 0
      | otherwise = lst !! idx

rule30Cell :: Int -> Int -> Int -> Int
rule30Cell p q r = p `xor` (q .|. r)

-- (p, q, r) ↦ p XOR (q OR r)
