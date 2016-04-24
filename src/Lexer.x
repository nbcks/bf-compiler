{
module Lexer where
}

%wrapper "basic"

tokens :-
  
  $white+                          ;
  [\>\<\+\-\,\.]+                  { \s -> TokCommands s }
  \[                               { \s -> TokLoopStart }
  \]                               { \s -> TokLoopEnd }
  
{
data Token =
  TokCommands String | TokLoopStart | TokLoopEnd deriving Show

lexer :: String -> [Token]
lexer = alexScanTokens
}

