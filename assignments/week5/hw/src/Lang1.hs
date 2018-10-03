module Lang1 where

-- We will make a very simple extension to the example AST by adding a separator this will 
-- join two abstract syntax trees; both will be evaluated, but only the value of the second
-- will be returned. It is not useful now but it will be useful later.

data Ast =
    AstInt Integer
  | Plus Ast Ast
  | Separator Ast Ast

-- Evaluate the AST to calculate its value

eval :: Ast -> Integer
eval = undefined

-- show the pre evaluated expression, see tests

instance Show Ast where
  show (Separator l r) = show l ++ ";" ++ show r 
  show _ = undefined

-- equality on eval result

instance Eq Ast where
  _ == _ = undefined
  
-- order on eval result

instance Ord Ast where
  _ <= _ = undefined
  
