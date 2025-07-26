{-
-- EPITECH PROJECT, 2025
-- B-FUN-400-NAN-4-1-wolfram-albane.merian
-- File description:
-- Parse
-}


module Parse where
import Text.Read (readMaybe)
import Data.Maybe (isNothing, fromMaybe)
import System.IO (hPutStrLn, stderr)
import System.Exit (exitWith, ExitCode(ExitFailure))

parseRules :: [String] -> [Int]
parseRules [] = []
parseRules ("--rule" : n : rest) = case readMaybe n of
    Just num -> num : parseRules rest
    Nothing -> parseRules rest
parseRules (_ : rest) = parseRules rest

parsAg :: [String] -> IO [(String, Int)]
parsAg [] = return []
parsAg (flag:value:xs) =
    case readMaybe value of
        Just n -> case flag of
            "--move" -> parsAg xs >>= \rest -> return ((flag, n) : rest)
            _ | n >= 0 -> parsAg xs >>= \rest -> return ((flag, n) : rest)
              | otherwise -> hPutStrLn stderr ("Negative int after " ++ flag)
                            >> exitWith (ExitFailure 84)
        Nothing -> hPutStrLn stderr ("Error: Expected integer after " ++ flag)
                   >> exitWith (ExitFailure 84)
parsAg (flag:xs) =
    hPutStrLn stderr ("Error: Expected integer after " ++ flag) >>
    exitWith (ExitFailure 84)

parseArguments :: [String] -> IO (Maybe Int, Bool, Bool, Bool, Int, Int, Int, Int)
parseArguments args = do
    parsedArgs <- parsAg args
    let rules = parseRules args
        rule = if null rules then Nothing else Just (head rules)
        r30 = 30 `elem` rules
        r90 = 90 `elem` rules
        r110 = 110 `elem` rules
    return (rule, r30, r90, r110, fromMaybe (-1) (lookup "--lines" parsedArgs),
            fromMaybe 0 (lookup "--start" parsedArgs), fromMaybe 80 (lookup
            "--window" parsedArgs), fromMaybe 0 (lookup "--move" parsedArgs))



--monade either
-- parseArguments :: [String] -> IO (Maybe Int, Bool, Bool, Bool, Int, Int, Int, Int)
-- parseArguments args = do
--     parsedArgs <- parseArgs args
--     let rule = parseRule args
--         r30 = rule == Just 30
--         r90 = rule == Just 90
--         r110 = rule == Just 110
--         lines = fromMaybe (-1) (lookup "--lines" parsedArgs)
--         start = fromMaybe 0 (lookup "--start" parsedArgs)
--         window = fromMaybe 80 (lookup "--window" parsedArgs)
--         move = fromMaybe 0 (lookup "--move" parsedArgs)
--     return (rule, r30, r90, r110, lines, start, window, move)
