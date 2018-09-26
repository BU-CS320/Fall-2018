module WarmUp where

-- create a list that is never empty

data NonEmptyList a -- deriving Show

example :: NonEmptyList Bool
example = undefined

len :: NonEmptyList a -> Integer
len = undefined


-- Write a function sumsq n, which returns the
-- sum of the first n natural numbers: 1^2 + 2^2 + ... + n^2
-- Hint: use only foldr, a helper function,  and the list 
-- notation [1..n], which is the Haskell version of
-- Pythons range(..).  Example:  [1..4] => [1,2,3,4]

addsq :: Float -> Float -> Float
addsq x y = (x**2) + y

sumsqa :: Float -> Float
sumsqa n = foldr addsq 0 [1..n]


-- we'll come back to this later

instance  Eq a => Eq (NonEmptyList a) where
  x == y = undefined


instance  Show a => Show (NonEmptyList a) where
  show x = undefined

-- Think about what rules should go along with each class

class Insultable a where
  insult :: a -> String 
  cheerUp :: a -> String 
  cheerUp x =  (insult x) ++ " you're ok, that's not really true,"
  
-- insult some types

instance  Insultable Bool where
  insult x = undefined
  