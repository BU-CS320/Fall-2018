module LangParser where

import Lang
import ParserMonad



parser :: Parser Ast
parser = undefined

-- note that the parser must respect all the precedence and associativity rules expressed in the prettyShow function.
-- that means
-- ! binds more tightly than
-- * / which binds more tightly than
-- + - which binds more tightly than
-- && which binds more tightly than
-- || which binds more tightly than
-- : which binds more tightly than
-- {the application} which binds weakest of all

-- + - * / && || {the application} are left associative
-- : is right associative

-- we are mostly following the questionable c precedence rules

-- ungraded bonus: add additional pretty syntax for lists: [1,2,3,4]




-- -- some general functions that make parsing this easier
--
-- oneOf :: [Parser a] -> Parser a
-- oneOf [] = failParse
-- oneOf (pa:rest) = pa <||> oneOf rest
--
-- -- *LangParser> parse (oneOf [ints,bools]) "-78"
-- -- Just (-78,"")
-- -- *LangParser> parse (oneOf [ints,bools]) " true"
-- -- Just (true,"")
-- -- *LangParser> parse (oneOf [ints,bools]) " tr ue"
-- -- Nothing
--
--
-- -- we saw before the midterm that there were issues when there are multiple operators with the same precedence, this is a helper function to handle those
-- -- this generalizes the helper function posted on piaza from last time
-- -- it is left associative
-- withInfix :: Parser a -> [(String, a -> a -> a)] -> Parser a
-- withInfix pa ls = let operators = fmap fst ls
--                       opParsers = fmap (\ s -> token $ literal s) operators
--
--                       --innerParser :: a -> Parser a, where a is the same as above
--                       innerParser left = do s <- oneOf opParsers
--                                             next <- pa
--                                             case lookup s ls of
--                                              Nothing -> failParse
--                                              Just f ->  let out = f left next
--                                                         in (innerParser out) <||> return out
--                   in do l <- pa
--                         (innerParser l) <||> (return l)
--
-- -- *LangParser> parse (withInfix intParser [("+", (+)), ("-", (-))]) "1+2+3+4-5"
-- -- Just (5,"")
-- -- *LangParser> parse (withInfix intParser [("+", (+)), ("-", (-))]) "100-1-10"
-- -- Just (89,"")
--
--
-- -- you may want to structure you grammar like this:
--
-- keywords = ["if","then","else", "let", "in", "true","false"]
--
--
-- vars :: Parser Ast
-- vars = do s <- token $ varParser
--           if s `elem` keywords
--           then failParse
--           else return $ Var s
--
-- ints :: Parser Ast
-- ints = undefined
--
-- bools :: Parser Ast
-- bools = undefined
--
-- nil :: Parser Ast
-- nil = undefined
--
--
-- apps :: Parser Ast
-- apps = withInfix undefined [("",App)] -- the tokens eat up all the spaces so we split on the empty string
--
--
-- cons :: Parser Ast
-- cons = undefined
--
-- -- *LangParser> parse cons "1 : 4: true"
-- -- Just (1 : 4 : true,"")
-- -- *LangParser> parse cons "1 : 4: 3+5"
-- -- Just (1 : 4 : (3 + 5),"")
--
--
-- orExpr :: Parser Ast
-- orExpr = undefined
--
-- -- *LangParser> parse orExpr "true || false && 7"
-- -- Just (true || false && 7,"")
-- -- *LangParser> parse orExpr "true || false || 7"
-- -- Just (true || false || 7,"")
-- -- *LangParser> parse orExpr "true"
-- -- Just (true,"")
--
-- andExpr :: Parser Ast
-- andExpr = undefined
--
-- -- *LangParser> parse andExpr "false"
-- -- Just (false,"")
-- -- *LangParser> parse andExpr "false && false"
-- -- Just (false && false,"")
--
-- addSubExpr :: Parser Ast
-- addSubExpr = undefined
--
-- -- *LangParser> parse addSubExpr "1+2+3+4"
-- -- Just (1 + 2 + 3 + 4,"")
-- -- *LangParser> parse addSubExpr "1-2-3-4"
-- -- Just (1 - 2 - 3 - 4,"")
--
-- multDivExpr :: Parser Ast
-- multDivExpr = undefined
--
-- notExp :: Parser Ast
-- notExp = undefined
--
--
-- atoms:: Parser Ast
-- atoms = ints <||> bools  <||>  nil <||> parens <||> ifParser <||> letParser <||>  lambdaParser <||> vars
--
-- -- *LangParser> parse atoms "111"
-- -- Just (111,"")
-- -- *LangParser> parse atoms "  true"
-- -- Just (true,"")
--
--
-- ifParser :: Parser Ast
-- ifParser = undefined
--
-- letParser :: Parser Ast
-- letParser = undefined
--
-- -- *LangParser> parse letParser "let x=3 in x+x"
-- -- Just (let x = 3 in x + x,"")
--
--
--
-- lambdaParser :: Parser Ast
-- lambdaParser = undefined
--
--
-- parens :: Parser Ast
-- parens = undefined
--
-- -- *LangParser> parse parser "(true)"
-- -- Just (true,"")
-- -- *LangParser> parse parser "let x = (if true and false then 3 else elsee) in x + x"
-- -- Just (let x = if true and false then 3 else elsee in x + x,"")




-- Some examples of weird stuff

-- ex = prettyShow  (Mult (Var "a") (Or (Var "b") (Var "c"))) 0
--
-- ex1 = prettyShow (Minus (Var "y") (Minus (App (ValBool True) (ValInt (-3))) (Mult (ValBool False) (ValBool False)))) 0
--
-- ex2 = prettyShow (Cons (Var "z") (Not (Not (Plus (Mult (ValInt (-18)) Nil) (Not (ValInt 2)))))) 0
--
-- ex3 = "! ! (-18)"