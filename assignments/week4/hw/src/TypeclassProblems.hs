module TypeclassProblems where

-- type classes have some rules, Haskell people call these rules "Laws"

-- for instance the following should be true for any Eq instance
-- Reflexive: for all x.  x == x
-- Symmetric: for all x, y. x == y iff y == x
-- Transitive: for all x, y, z. if x == y and y == z then x == z

-- let's break some laws

-- let's break the Reflexive law
data NotReflexive -- = .. 

instance Eq NotReflexive where
  x == y = undefined


-- give an example where "example /= example"
example :: NotReflexive
example = undefined

-- let's break the Symmetric law
data NotSymmetric -- = .. 

instance Eq NotSymmetric where
  x == y = undefined

-- give an examples where "examplex' == exampley'" but "exampley' /= examplex'"
examplex' :: NotSymmetric
examplex' = undefined

exampley' :: NotSymmetric
exampley' = undefined

-- let's break the Transitive law
data NotTransitive -- = .. 

instance Eq NotTransitive where
  x == y = undefined

-- give an examples where "examplex'' == exampley''" and exampley'' == examplez''"  but "examplex'' /= examplez''"
examplex'' :: NotTransitive
examplex'' = undefined

exampley'' :: NotTransitive
exampley'' = undefined

examplez'' :: NotTransitive
examplez'' = undefined


-- there is a more interesting type class called a functor that defined how something is "mappable". It has the laws
-- fmap respects identity: fmap id = id
-- fmap respects composition: fmap (g . f) = fmap g . fmap f


data ListNoIdentity a = NillNi | ConsNi a (ListNoIdentity a) deriving (Show, Eq)

instance Functor ListNoIdentity where
  fmap f ls = undefined

-- give an example list where "fmap id exampleBadId /= exampleBadId"
exampleBadId :: ListNoIdentity Integer
exampleBadId = undefined

-- here we will break the composition law really bad
data ListNoComposition a = NillNc | ConsNc a (ListNoComposition a) deriving (Show, Eq)

instance Functor ListNoComposition where
  fmap f ls = undefined

-- give example functions and list so that, "fmap (g . f) ls /= (fmap g . fmap f) ls "

ls :: ListNoComposition Integer
ls = undefined

f :: Integer -> Integer
f = undefined

g :: Integer -> Integer
g = undefined




