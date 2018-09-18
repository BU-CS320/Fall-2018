module Data where
import Prelude(Show, undefined)

-- When thinking about data in Haskell always think

-- What is the only way to create a data?

-- What is the only way to use a data?


data Bool = True | False deriving Show

exampleBool1 = undefined
exampleBool2 = undefined

and _ _ = undefined


data Nat = Zero | Succ Nat deriving Show

three = undefined
five = undefined

add _ _ = undefined

-- now write your own data type, for the colors of a stop light

-- data Stoplight = ... deriving Show

favoriteColor = undefined

canGo _ = undefined


data ListNat = NilNat | ConsNat Nat ListNat deriving Show

exampleListNat = undefined

lengthOfListNat _  = undefined


data ListBool = NilBool | ConsBool Bool ListBool deriving Show

exampleListBool = undefined

lengthOfListBool _  = undefined

-- ... this get's very tiresome

data List a = Nil | Cons a (List a) deriving Show -- where a means anything

exampleList = undefined

length _ = undefined


-- data StudentYear = ... deriving Show -- where a means anything

exampleStudentYear = undefined

-- write an function that shows how many years a student is expected to graduate.  For instance a Sophomore is expected to graduate in 3 years.
expectedYearsToGraduate _ = undefined

-- how can we write the inverse?
fromExpectedYearsToGraduate _ = undefined



-- what is the smallest datatype you can come up with?
-- data Smallests = ... deriving Show

-- exampleSmallest = undefined



-- what is the crazieset datatype you can come up with?
-- data Craziests = ... deriving Show

exampleCraziests = undefined


