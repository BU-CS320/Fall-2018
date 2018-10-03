module Lang3 where
import Data.Map -- for state, similar to index tree

-- We will now add identifiers and a global assignment command to the abstract syntax tree. Assignment should evaluate to the value of the assignment and store the value in the global memory state.

data Ast =
      AstInt Integer
    | Id String
    | Plus Ast Ast
    | Assign String Ast
    | Separator Ast Ast


type State = Map String Integer

-- hint use Data.Map.lookup
eval :: State -> Ast -> (State, Maybe Integer)
eval = undefined

-- show the pre evaluated expression, see tests
instance Show Ast where
  show _ = undefined


-- equality on eval result, including state
instance Eq Ast where
  _ == _ = undefined