module Main where
import Parser
import Lexer
import Gen(genProg)

main :: IO ()
main = do
  lexed <- fmap lexer getLine
  putStrLn "Tokens: "
  putStrLn $ show lexed
  putStrLn "Tree: "
  parsed <- return $ parse lexed
  putStrLn $ show parsed
  putStrLn "Program: "
  putStrLn $ genProg parsed
  writeFile "main.c" $ genProg parsed
	
