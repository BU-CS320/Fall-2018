module Arith where

import ExceptionMonad
import ParserMonad

-- hint read about the Rational type

-- write a full arithmetic language, it must have a nice show, eval and parser

-- your language must support numbers , addition, subtraction, multiplication, division

-- your parser must support the above and parentheses, natural numbers, white space, and standard precedence rules

-- your show should look nice, and should be parsable

-- ungraded bonus: handle negative numbers, decimals
-- ungraded bonus: add operations like power or mod

data Arith -- = Put your constructors here


eval :: Arith -> Unsafe Rational
eval = undefined

parse :: Parser Arith
parse = undefined

-- a human readable string
instance Show Arith where
  show _ = undefined


-- structural equality on your AST "2 + 2 /= 4" but "2*3 + 4*5" == "(2*3) + (4*5)"
-- mostly for testing
instance Eq Arith where
  _ == _ = undefined