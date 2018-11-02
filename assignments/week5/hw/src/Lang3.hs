module Lang3 where
import Data.Map -- for state, similar to index tree

-- We will now add identifiers and a global assignment command to the abstract syntax tree. 
-- Assignment should evaluate to the value of the assignment and store the value in the global memory state.
-- The state (containing values for variables) is passed along as the evaluation proceeds; as Assign
-- expressions are evaluated, bindings are added to the state, and when Id expressions are evaluated
-- they are looked up in the state. Imagine walking around the AST in preorder and keeping track
-- of the state as we do so. 

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
