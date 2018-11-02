module Lang2 where

-- We will now add a print command to the abstract syntax tree. print takes one expression,
-- evaluates it, prints the result, and finally evaluates to that result.

data Ast =
    AstInt Integer
  | Plus Ast Ast
  | Separator Ast Ast
  | Print Ast
  deriving Eq


eval :: Ast -> (Integer, [Integer])
eval (AstInt i)        = (i, [])
eval (Plus l r)        = let (resultL, printL) = eval l
                             (resultR, printR) = eval r
                         in (resultL + resultR, printL ++ printR)
eval (Separator l r)   = let (_     , printL) = eval l
                             (result, printR) = eval r
                         in (result, printL ++ printR)
eval (Print ast)       = let (result, printL) = eval ast
                         in (result, printL ++ [result])



instance Show Ast where
  show (AstInt i)      = show i
  show (Plus x y)      = "("++ show x ++ "+" ++ show y ++ ")"
  show (Separator x y) = "("++ show x ++ ";" ++ show y ++ ")"
  show (Print x ) = "print ("++ show x ++ ")"

