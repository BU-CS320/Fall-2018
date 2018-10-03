module Lang4 where
import Data.Map -- for Env

-- We will now add identifiers and let expressions to the abstract syntax tree. let should return the 2nd expression under the assignment.

data Ast =
      AstInt Integer
    | Id String
    | Plus Ast Ast
    | Let String Ast Ast
    | Separator Ast Ast


type Env = Map String Integer

eval :: Env -> Ast -> Maybe Integer
eval = undefined

-- show the pre evaluated expression, see tests
instance Show Ast where
  show _ = undefined


-- equality on eval result
instance Eq Ast where
  _ == _ = undefined