module Lang1 where

-- We will make a very simple extension to the example AST by adding a separator this will
-- join two abstract syntax trees; both will be evaluated, but only the value of the second
-- will be returned. It is not useful now but it will be useful later.


data Ast =
    AstInt Integer
  | Plus Ast Ast
  | Separator Ast Ast
  deriving Eq


eval :: Ast -> Integer
eval (AstInt i)        = i
eval (Plus l r)        = (eval l) + (eval r)
eval (Separator _ ast) = eval ast


instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"
  show (Separator x y) = "("++ show x ++ ";" ++ show y ++ ")"