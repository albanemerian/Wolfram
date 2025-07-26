{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- Print
-}

module Print where
import Data.List (intercalate)

printState :: Int -> [Int] -> IO ()
printState window state =
    let mid = length state `div` 2
        shiftRight = 0
        startIdx = mid - (window `div` 2) + shiftRight
        display = take window (drop startIdx state)
    in putStrLn $ intercalate "" [if x == 1 then "*" else " " | x <- display]
