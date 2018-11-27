module Lang where

import Prelude hiding (lookup)
import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import EnvUnsafe


-- Here is the abstract syntax tree for our language

data Ast = ValBool Bool
         | And Ast Ast | Or Ast Ast | Not Ast

         | ValInt Integer
         | Plus Ast Ast | Minus Ast Ast | Mult Ast Ast | Div Ast Ast

         | Nil
         | Cons Ast Ast

         | If Ast Ast Ast
         | Let String Ast Ast

         | Var String
         | Lam String Ast
         | App Ast Ast
--           deriving (Eq,Show) -- helpful to use this during testing
         deriving Eq

instance Show Ast where
  show ast = prettyShow ast 0


-- the goal of the program is to return a value
data Val = I Integer | B Bool
         | Ls [Val]
         | Fun (Val -> Unsafe Val) -- since this is a functional language, one thing that can be returned is a function

instance Show Val where
  show (I i) = show i
  show (B b) = show b
  show (Ls ls) = show ls
  show (Fun _) = "->" -- no good way to show a function


stdLib = fromList [("tail", Fun $ \ v -> case v of Ls (_:ls)-> Ok $ Ls ls
                                                   _ -> Error "not an non empty list"),
                   ("head", undefined),
                   ("len", undefined)]

-- helper function that runs with a standard library of functions: head, tail ...
run :: Ast -> (Unsafe Val)
run a = r (eval a) stdLib



type Env = Map String Val


eval :: Ast -> EnvUnsafe Env Val
eval = undefined


-- some examples
-- example = let x = Var "x"
--           in run $ App (Lam "x" ( x `Plus` x))  (ValInt 7)
--
-- example2 = let x = Var "x"; y = Var "y"
--            in run $ ((Lam "x" (Lam "y" ( x `Plus` y))) `App` (ValInt 7)) `App` (ValInt 4)

-- some helper function, you may find helpful
-- valOf :: String -> EnvUnsafe Env Val
-- valOf var = undefined
--
-- -- add a val into the environment
-- withVal :: String -> Val -> EnvUnsafe Env a -> EnvUnsafe Env a
-- withVal var v comp = undefined

-- helper functions that take care of type issues (use a "Error" when things have the wron type
-- evalInt :: Ast -> EnvUnsafe Env Integer
-- evalInt a = undefined
--
-- evalBool :: Ast -> EnvUnsafe Env Bool
-- evalBool a = undefined
--
-- evalFun :: Ast -> EnvUnsafe Env (Val -> Unsafe Val)
-- evalFun a = undefined
-- ...

-- ungraded bonus challenge: use a helper type class to do this functionality



-- This is helpful for testing and debugging
fullyParenthesized :: Ast -> String
fullyParenthesized (ValInt i) = "(" ++ show i ++ ")"
fullyParenthesized (ValBool True) = "(" ++ "true" ++ ")"
fullyParenthesized (ValBool False) = "(" ++ "false" ++ ")"
fullyParenthesized (And l r) = "(" ++ (fullyParenthesized l) ++ " && " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (Or l r) = "(" ++ (fullyParenthesized l) ++ " || " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (Not a) = "(" ++ " ! " ++ (fullyParenthesized a) ++ ")"
fullyParenthesized (Plus l r) = "(" ++ (fullyParenthesized l) ++ " + " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (Minus l r) = "(" ++ (fullyParenthesized l) ++ " - " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (Mult l r) = "(" ++ (fullyParenthesized l) ++ " * " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (Div l r) = "(" ++ (fullyParenthesized l) ++ " / " ++ (fullyParenthesized r) ++ ")"
fullyParenthesized (If b t e) = "(if " ++ (fullyParenthesized b) ++ " then " ++ (fullyParenthesized t) ++ " else " ++ (fullyParenthesized e) ++ ")"
fullyParenthesized (Let v a bod) = "(let " ++ v ++ " = " ++ (fullyParenthesized a) ++ " in " ++ (fullyParenthesized bod) ++ ")"
fullyParenthesized (Lam v bod) = "(\\ " ++ v ++ " -> " ++ (fullyParenthesized bod) ++ ")"
fullyParenthesized (App f a) = "( " ++ (fullyParenthesized f)  ++ " " ++ (fullyParenthesized a) ++ ")"
fullyParenthesized (Var s) = "( " ++ s ++ ")"
fullyParenthesized (Cons h t) = "(" ++ (fullyParenthesized h)  ++ " : " ++ (fullyParenthesized t) ++ ")"
fullyParenthesized Nil = "( [] )"


showPar :: Bool -> String -> String
showPar True s = "(" ++ s ++ ")"
showPar False s =  s


-- provide a nice show with minimal parentheses, for testing an documentation
--the bigger the number the more tight he biding
prettyShow :: Ast -> Integer -> String
prettyShow (ValInt i) _ =  if i < 0
                           then  "(" ++ show i ++ ")"
                           else show i
prettyShow (ValBool True) _ =  "true"
prettyShow (ValBool False)  _  = "false"
prettyShow Nil _ = "[]"
prettyShow (Var s) _ = s

prettyShow (Lam v bod) i = showPar (i>1) $ "\\ " ++ v ++ " -> " ++ (prettyShow bod 1)
prettyShow (Let v a bod)  i = showPar (i>1) $  "let " ++ v ++ " = " ++ (prettyShow a 1) ++ " in " ++ (prettyShow bod 1)
prettyShow (If b t e) i = showPar (i>1) $  "if " ++ (prettyShow b 1) ++ " then " ++ (prettyShow t 1) ++ " else " ++ (prettyShow e 1)

prettyShow (App l r) i = showPar (i>2) $ (prettyShow l 2) ++ " " ++ (prettyShow r 3)
prettyShow (Cons l r) i = showPar (i>4) $ (prettyShow l 5) ++ " : " ++ (prettyShow r 4)
prettyShow (Or l r) i = showPar (i>6) $ (prettyShow l 6) ++ " || " ++ (prettyShow r 7)
prettyShow (And l r) i = showPar (i>8) $ (prettyShow l 8) ++ " && " ++ (prettyShow r 9)
prettyShow (Minus l r) i = showPar (i>10) $ (prettyShow l 10) ++ " - " ++ (prettyShow r 11)
prettyShow (Plus l r) i = showPar (i>10) $ (prettyShow l 10) ++ " + " ++ (prettyShow r 11)
prettyShow (Mult l r) i = showPar (i>12) $ (prettyShow l 12) ++ " * " ++ (prettyShow r 13)
prettyShow (Div l r) i = showPar (i>12) $ (prettyShow l 12) ++ " / " ++ (prettyShow r 13)

prettyShow (Not l ) i = showPar (i>14) $  " ! " ++ (prettyShow l 14)


--some more examples:

-- e1 = prettyShow (Minus (ValInt 100) (Minus (ValInt 2) (ValInt 5))) $  0
-- e2 = prettyShow (Minus (Minus (ValInt 100) (ValInt 2)) (ValInt 5) ) $  0
--
--
-- e3 = prettyShow (Minus (Minus (ValInt 100) (ValInt 2)) (Div (Div (ValInt 100) (ValInt 2)) (ValInt 5) )  ) $ 0
-- e4 = prettyShow (Div (Minus (ValInt 100) (ValInt 2)) (Div (Div (ValInt 100) (ValInt 2)) (ValInt 5) )  ) $ 0
-- e5 = prettyShow (((Var "fun") `App` (ValInt 2)) `App` (ValInt 5)) $ 0
--
-- e6 = prettyShow (Not $ Not $ ((Var "fun") `App` (ValInt 2)) `App` (Not $ ValInt 5)) $ 0

