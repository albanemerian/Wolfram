{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- rules110
-}

module Rules110 (rule110) where

import Data.Bits (xor, (.|.), (.&.))


rule110 :: [Int] -> [Int]
rule110 current = [0] ++ [rule110Cell (get current (i - 1))
    (current !! i) (get current (i + 1)) | i <-
    [0..(length current - 1)]] ++ [0]
  where
    get lst idx
      | idx < 0 = 0
      | idx >= length lst = 0
      | otherwise = lst !! idx

rule110Cell :: Int -> Int -> Int -> Int
rule110Cell 1 1 1 = 0
rule110Cell 1 1 0 = 1
rule110Cell 1 0 1 = 1
rule110Cell 1 0 0 = 0
rule110Cell 0 1 1 = 1
rule110Cell 0 1 0 = 1
rule110Cell 0 0 1 = 1
rule110Cell 0 0 0 = 0

rule120 :: [Int] -> [Int]
rule120 current = [0] ++ [(current !! (i - 1) `xor` current !! i `xor` current
    !! (i + 1)) .|. (current !! (i - 1) .&. current !! (i + 1)) |
    i <- [1..(length current - 2)]] ++ [0]
