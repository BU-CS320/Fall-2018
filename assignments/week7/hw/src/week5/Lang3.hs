module Lang3 where

import Prelude hiding (lookup)
import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

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
  deriving Eq

type State = Map String Integer

eval :: State -> Ast ->  (State, Maybe Integer)
eval state (AstInt i) = (state, Just i)
eval state (Plus l r) = case eval state l of (stateL, Just resultL) -> case eval stateL r of (stateR, Just resultR) -> (stateR, Just (resultL + resultR))
                                                                                             (stateR, Nothing     ) -> (stateR, Nothing)
                                             (stateL, Nothing     ) -> case eval stateL r of (stateR, _           ) -> (stateR, Nothing)
eval state (Id ident) = (state, lookup ident state )
eval state (Assign s value) = case eval state value of (nextState, Just result) -> (insert s result nextState, Just result)
                                                       (nextState, Nothing    ) -> (nextState                , Nothing    )
eval state (Separator l r) = let (nextState, _) = eval state l
                             in eval nextState r

instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"
  show (Separator x y) = "("++ show x ++ ";" ++ show y ++ ")"
  show (Assign x y)    = "("++ x ++ " = " ++ show y ++ ")"
  show (Id x )         = x

