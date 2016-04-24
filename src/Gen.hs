module Gen where
import Parser(Prog, Block(..))

genProg :: Prog -> String
genProg prog = "#include <stdio.h>\n#include<stdlib.h>\n\nint main() { unsigned int array[30000] = {0}; unsigned int *ptr=array;" ++ genProg' prog ++ "}"

genProg' :: Prog -> String
genProg' = concat . map genBlock

genBlock :: Block -> String
genBlock (Commands cmds) = (concat . map genCmd) cmds
genBlock (Loop prog) = "\nwhile (*ptr) { \n" ++ genProg' prog ++ "}"

genCmd :: Char -> String
genCmd c 
  | c == '>' = "++ptr;"
  | c == '<' = "--ptr;"
  | c == '+' = "++*ptr;"
  | c == '-' = "--*ptr;"
  | c == '.' = "putchar(*ptr);"
  | c == ',' = "*ptr=getchar();"
  | otherwise = error "unknown command: " ++ [c]