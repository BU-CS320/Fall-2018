module Lang2 where

-- We will now add a print command to the abstract syntax tree. print takes one expression and it should evaluate the expression, print the result, and evaluate to that result.

data Ast =
    AstInt Integer
  | Plus Ast Ast
  | Separator Ast Ast
  | Print Ast


eval :: Ast -> (Integer, [Integer])
eval = undefined


-- show the pre evaluated expression, see tests
instance Show Ast where
  show _ = undefined


-- equality on eval result, including [Int]
instance Eq Ast where
  _ == _ = undefined
  
