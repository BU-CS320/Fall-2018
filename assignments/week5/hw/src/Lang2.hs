module Lang2 where

-- We will now add a print command to the abstract syntax tree. print takes one expression,
-- evaluates it, prints the result, and finally evaluates to that result.

data Ast =
    AstInt Integer
  | Plus Ast Ast
  | Separator Ast Ast
  | Print Ast


eval :: Ast -> (Integer, [Integer])
eval = undefined


-- show the unevaluated expression, see tests

instance Show Ast where
  show _ = undefined


-- equality on evaluated result, including [Int]

instance Eq Ast where
  _ == _ = undefined
  
