module Lang3 where

import Prelude hiding (lookup)
import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import StateMonad


data Ast =
      AstInt Integer
    | Id String
    | Plus Ast Ast
    | Assign String Ast
    | Separator Ast Ast
  deriving Eq

type State = Map String Integer


-- some helper functions you might use
--
-- these could also be done with do notation
-- valOf :: String -> Stateful State Integer
-- valOf var = Stateful $ \ s -> (case lookup var s of Nothing -> (0 ,s)
--                                                     Just i  -> (i ,s))
--
-- setVal :: String -> Integer ->Stateful State ()
-- setVal var i = Stateful $ \ s -> (() , insert var i s)


-- write eval, it should match https://github.com/BU-CS320/Fall-2018/blob/master/assignments/week7/hw/src/week5/Lang4.hs
-- however, for simplicity, you may return 0 when you cannot find a var
eval :: Ast -> Stateful State Integer
eval = undefined

instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"
  show (Separator x y) = "("++ show x ++ ";" ++ show y ++ ")"
  show (Assign x y)    = "("++ show x ++ " = " ++ show y ++ ")"
  show (Id x )         = x

