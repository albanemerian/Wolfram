{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- WolfRam
-}

module WolfRam (runWolfram) where
import Rules30 (rule30)
import Rules90 (rule90)
import Rules110 (rule110)
import Print (printState)

translate :: [Int] -> Int -> [Int]
translate curr 0 = curr
translate curr move
    | move < 0  = drop (abs move) curr ++ replicate (abs move) 0
    | otherwise = replicate move 0 ++ take (length curr - move) curr


sub :: Bool -> Bool -> Bool -> Int -> Int -> Int -> [Int] -> IO ()
sub r30 r90 r110 lines pos win curr =
    mapM_ (printState win) (take lines (drop pos (iterate iterateRules curr)))
  where
    iterateRules state
      | r90  = rule90 state
      | r30  = rule30 state
      | r110 = rule110 state
      | otherwise = state



runWolfram :: Bool -> Bool -> Bool -> Int -> Int -> Int -> Int -> IO ()
runWolfram r30 r90 r110 lines start window move =
    let initSize = 2 * window
        mid = initSize `div` 2
        shift = if even window then 1 else 0
        cur = replicate (mid + shift) 0 ++ [1] ++ replicate (mid + shift) 0
        translatedCurrent = translate cur move
    in if lines == -1
        then sub r30 r90 r110 maxBound start window translatedCurrent
        else sub r30 r90 r110 lines start window translatedCurrent

--remove maxbound
--datat type for full or empty
--interace (instances ( show )) so a type goes from a tpye to a string
-- cell data = full | empty
-- show full = '*'
--show empty = ' '
--use nohing instea'd of -1 for the loop
