{
module Parser where
import Lexer
}

%name parse 
%tokentype { Token }
%error { parseError }

%token 
  cmds    { TokCommands $$ }
  start   { TokLoopStart }
  end     { TokLoopEnd }
  
%%

Prog   : Block                         { [$1] }
       | Block Prog                    { $1 : $2 }

Block  : cmds                          { Commands $1 }
       | start Prog end                { Loop $2 }
	   


{
type Prog = [Block]
data Block
  = Commands String
  | Loop Prog deriving Show
  
parseError _ = error "Parse error"
}
