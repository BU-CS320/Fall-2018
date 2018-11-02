module Lang0 where

-- Consider the language defined by the following AST for adding numbers

data Ast =
    AstInt Integer
  | Plus Ast Ast

-- it can be evaluated with the function:

eval :: Ast -> Integer
eval = undefined

-- show the unevaluated expression, see tests

instance Show Ast where
  show _ = undefined


-- equality on the values returned after evaluation

instance Eq Ast where
  _ == _ = undefined
  
-- order on eval result

instance Ord Ast where
  _ <= _ = undefined
  

