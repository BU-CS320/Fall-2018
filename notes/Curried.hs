module Curried where

-- question: what's the deal with curried functions?

-- uncurried 
fun :: (Integer, String) -> [Integer]
fun (i, s)  = [i]

-- can be called like
example = fun (1, "hi")


-- curried 
fun' :: Integer -> String -> [Integer]
fun' i s = [i]

-- can be called like
example' = fun' 1 "hi"

-- but can also be called like
newFun = fun 1


-- Haskell actually supports both styles, but the Curried style is slightly more convenient from a functional perspective