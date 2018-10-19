module Lang4 where

import Prelude hiding (lookup)
import Data.Map(Map, lookup, insert, empty, fromList)  -- for Env

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
  deriving Eq

type Env = Map String Integer

eval :: Env -> Ast -> Maybe Integer
eval env (AstInt i) = Just i
eval env (Plus l r) = case ((eval env l),(eval env r) ) of (Just rl, Just rr) -> Just (rl + rr)
                                                           (_      , _      ) -> Nothing
eval env (Id ident) = (lookup ident env)
eval env (Let ident result inThis) = case (eval env result) of Just i  -> eval (insert ident i env) inThis
                                                               Nothing -> Nothing
eval env (Separator _ r) = eval env r


instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"
  show (Separator x y) = "("++ show x ++ ";" ++ show y ++ ")"
  show (Let ident x y) = "(let "++ ident ++ " = " ++ show x ++ " in " ++ show y ++ ")"
  show (Id x )         = x



