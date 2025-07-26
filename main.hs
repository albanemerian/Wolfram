{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- main
-}

import WolfRam (runWolfram)
import Parse (parseArguments)
import Data.Maybe (isNothing, fromMaybe)
import qualified System.Environment as SE
import System.Exit (exitWith, ExitCode(ExitFailure))

validateRules :: Bool -> Bool -> Bool -> Bool
validateRules r30 r90 r110 =
    not ((r30 && r90) || (r30 && r110) || (r90 && r110) ||
        (not r30 && not r90 && not r110))

displayUsage :: IO ()
displayUsage =
    putStrLn "Usage: ./wolfram --rule [30|90|110] --lines [number] " >>
    putStrLn "[--start [number]] [--width [number]] [--move [number]]" >>
    exitWith (ExitFailure 84)

handleError :: String -> IO ()
handleError msg =
    putStrLn msg >>
    exitWith (ExitFailure 84)

main :: IO ()
main = do
    av <- SE.getArgs
    (rule, r30, r90, r110, lines, start, window, move) <- parseArguments av
    case () of
        _ | not (validateRules r30 r90 r110) -> handleError "Multiple rules"
          | isNothing rule -> displayUsage
          | otherwise -> runWolfram r30 r90 r110 lines start window move
