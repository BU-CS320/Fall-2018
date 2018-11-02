module Lang4 where
import Data.Map -- for Env

-- We will now add let expressions to the abstract syntax tree. 
-- Let String Ast Ast makes a local assignment of the first Ast to the String
-- in the state and evaluates the second Ast in this environment and returns
-- the result of the second Ast. 

data Ast =
      AstInt Integer
    | Id String
    | Plus Ast Ast
    | Let String Ast Ast
    | Separator Ast Ast

type Env = Map String Integer

eval :: Env -> Ast -> Maybe Integer
eval = undefined

-- show the unevaluated expression, see tests

instance Show Ast where
  show _ = undefined

-- equality on eval result

instance Eq Ast where
  _ == _ = undefined
