module DataExamples where
import Prelude(Show)

-- same as video

data Bool = True | False deriving Show

data Nat = Zero | Succ Nat deriving Show

data NatList = Nil | Cons Nat NatList deriving Show

data NatTree = Null | Node Nat NatTree NatTree deriving Show



-- What is the only way to create a data?

-- What is the only way to use a data?



-- example

--and

data StreetLight = ... deriving Show
-- example

canGo

data Nat = Zero | Succ Nat  deriving Show

-- example

data List a = Nil | Cons a (List a)  deriving Show

data Tree a = Empty | Node (Tree a) a (Tree a)  deriving Show

data Students = ...

data Dessert = ...

data Silly = ...

data SmallestData = ...

data CrazyData = ...

data Maybe a = Nothing | Just a  deriving Show

exor

iseven

size







