module WarmUp where

-- create a list that is never empty

data NonEmptyList a -- deriving Show

example :: NonEmptyList Bool
example = undefined

len :: NonEmptyList a -> Integer
len = undefined


-- we'll come back to this later

instance  Eq a => Eq (NonEmptyList a) where
  x == y = undefined


--instance  Show a => Show (NonEmptyList a) where
--  show x = undefined

-- Think about what rules should go along with each class

class Insultable a where
  insult :: a -> String 
  cheerUp :: a -> String 
  cheerUp x =  (insult x) ++ " you're ok, that's not really true,"
  
-- insult some types

instance  Insultable Bool where
  insult x = undefined
  