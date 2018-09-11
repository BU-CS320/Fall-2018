module DataExamples where
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


data ListNat = Nil | Cons Nat ListNat deriving Show

exampleListNat = undefined

lengthOfListNat _  = undefined


data ListBool = Nil | Cons Bool ListBool deriving Show

exampleListBool = undefined

lengthOfListBool _  = undefined

-- ... this get's very tiresome

data List a = Nil | Cons a List deriving Show -- where a means anything

exampleList = undefined

length _ = undefined


-- data StudentYear = ... deriving Show -- where a means anything

exampleStudentYear = undefined

expectedGraduateion _ = undefined

-- how can we write the inverse?
--fromExpectedGraduateion _ = undefined



-- what is the smallest datatype you can come up with?
-- data Smallests = ... deriving Show

-- exampleSmallest = undefined



-- what is the crazieset datatype you can come up with?
-- data Craziests = ... deriving Show

exampleCraziests = undefined


