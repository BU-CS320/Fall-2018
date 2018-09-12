module Hw where
import Prelude(Show, undefined)

-- Data Declarations - "deriving Show" will allow 
-- data values to be printed by interpreter

data Bool = True | False     deriving Show

data Nat =  Zero | Succ Nat    deriving Show

-- define the following functions

not :: Bool -> Bool
not _ = undefined

or :: Bool -> Bool -> Bool
or _ _ = undefined


-- you can also define an "if" construct
cond  True  x  y = x                             
cond  False x  y = y

-- basic arithmetic

-- constants are like 0-ary functions (no arguments)
-- and must be in lower case

-- define the first 5 numbers

zero :: Nat
zero = undefined

one :: Nat
one = undefined

two :: Nat
two = undefined

three :: Nat
three = undefined

four :: Nat
four = undefined

five :: Nat
five = undefined

-- we defined addition in lab

-- define the following functions
mult :: Nat -> Nat -> Nat
mult _ _     = undefined

exp :: Nat -> Nat -> Nat
exp _ _     = undefined

-- relational operators on Nat

-- when are 2 Nats equal?
eq :: Nat -> Nat -> Bool
eq _ _     = undefined

-- when are 2 Nats not equal?
ne :: Nat -> Nat -> Bool
ne _ _     = undefined

-- the less then function, when is the first argument less then the 2nd
lt :: Nat -> Nat -> Bool
lt _ _     = undefined


-- misc arith functions

--return the largest of 2 Nats
max :: Nat -> Nat -> Nat
max _ _     = undefined



-- write a data type for the days of the week
data Weekday -- = ...  deriving Show

-- what is your favorite Day?
favoriteDay :: Weekday
favoriteDay = undefined

-- write a function that returns true if it is a weekday
isWeekend :: Weekday -> Bool
isWeekend  _     = undefined

-- write a data type for the Months of the year
data Month -- = ...  deriving Show

-- what month has your birthday?
partyMonth :: Month
partyMonth = undefined

-- write a function that tells when a month is in the 2018 Fall Semester (see https://www.bu.edu/reg/calendars/) return True if it is
needToDoWork :: Month -> Bool
needToDoWork _ = undefined


-- write a data type that contains a month, a Nat (representing which week), and a weekday
data Date -- = ...  deriving Show

-- when is this homework due?
homworkIsDueOn :: Date
homworkIsDueOn  = undefined

-- write a program that returns true on CS 320 lecture dates
lectureDay :: Date -> Bool
lectureDay _ = undefined


-- write a data type for a 2D point where x and y are Nats
data Point --  = ...  deriving Show

-- take in 2 Nats to make your point
makePoint :: Nat -> Nat -> Point
makePoint _ _ = undefined


-- the Manhattan distance is the distance in the x direction plus the distance in the y direction
-- for instance the manhatan distance of points (2,5) and (3,1) is 5
manhattanDistance :: Point -> Point -> Nat
manhattanDistance _ _ = undefined


-- assume there is a sad math calss where students can only answer with a Bool OR with a Nat, write a data type for that answer
data SadAnswer -- = ...  deriving Show

-- make a Nat answer
answerNat :: Nat -> SadAnswer
answerNat _ = undefined

-- make a Bool answer
answerBool :: Bool -> SadAnswer
answerBool _ = undefined

-- what is 100 - 99?
ans1 :: SadAnswer
ans1 = undefined

-- is 100 - 99 an odd number?
ansTrue :: SadAnswer
ansTrue = undefined


-- we saw in lab how to write lists for specific data
data ListNat = NilNat | ConsNat Nat ListNat    deriving Show

-- write a function that adds everything in the list
sum :: ListNat -> Nat
sum _     = undefined

-- write a function that tells when 2 nat lists are equal
eq_list :: ListNat -> ListNat -> Bool
eq_list _ _                     = undefined

-- write a function that tests when a Nat is in a list
member :: Nat -> ListNat -> Bool
member _ _                = undefined



-- we also saw how to write general lists
data List a = Nil | Cons a (List a)    deriving Show


-- write a list of all the Bools
listOfBool :: (List Bool)
listOfBool = undefined

-- write a list of the first three Nats
listOfNat :: (List Nat)
listOfNat = undefined

-- write a list of all the week days
listOfWork :: (List Weekday)
listOfWork = undefined

-- functions on lists
length :: (List a) -> Nat
length _  = undefined


-- in lab we saw that we can return Maybe data when we want to return something but might not  
data Maybe x = Nothing | Just x     deriving Show

-- functions that returns something if it is the last element of the list and Nothing

last :: (List a) -> (Maybe a)
last _  = undefined


append :: (List a) -> (List a) -> (List a)
append  _ _  = undefined

addToEnd :: (List a) -> a -> (List a)
addToEnd _ _  = undefined

--reverse a List
rev :: (List a) -> (List a)
rev _  = undefined



-- like lists you can constuct a binary tree of Nats

data TreeNat = NullNat | NodeNat (TreeNat) Nat (TreeNat)     deriving Show

memberTreeNat :: Nat -> TreeNat -> Bool
memberTreeNat _ _  = undefined

eqTreeNat :: TreeNat -> TreeNat -> Bool
eqTreeNat _ _  = undefined


-- or a general binary tree

data Tree a = Null | Node (Tree a) a (Tree a)     deriving Show

size :: (Tree a) -> Nat
size  _  = undefined

-- suppose the height is number of nodes in longest path

height :: (Tree a) -> Nat
height  _  = undefined

-- do an inorder traversal
inorder :: (Tree a) -> (List a)
inorder  _  = undefined

-- do an preorder traversal
preorder :: (Tree a) -> (List a)
preorder  _  = undefined