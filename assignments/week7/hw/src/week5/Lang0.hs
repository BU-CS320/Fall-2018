module Lang0 where

-- Consider the language defined by the following AST for adding numbers

data Ast =
    AstInt Integer
  | Plus Ast Ast
  deriving Eq

-- it can be evaluated with the function:

eval :: Ast -> Integer
eval (AstInt i) = i
eval (Plus l r) = (eval l) + (eval r)

instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"

