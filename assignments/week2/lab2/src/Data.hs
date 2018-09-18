module Data where
import Prelude(Show, undefined)

-- When thinking about data in Haskell always think

-- What is the only way to create a data?

-- What is the only way to use a data?


data Bool = True | False deriving Show

exampleBool1 = True
exampleBool2 = True

and True True = True
and _ _ = False


data Nat = Zero | Succ Nat deriving Show

three = (Succ (Succ (Succ Zero)))
five = (Succ (Succ three))

add Zero Zero = Zero
add Zero (Succ x) = (Succ x)
add (Succ x) Zero = (Succ x)
add (Succ x) (Succ y) = (Succ (add x (Succ y)))

add' Zero anything = anything
add' (Succ x) y = (Succ (add' x y))

data Stoplight = Red | Yellow | Green deriving Show

favoriteColor = Red

canGo Red = False
canGo Yellow = True
canGo Green = True


data ListNat = NilNat | ConsNat Nat ListNat deriving Show

exampleListNat = NilNat
exampleListNat' = ConsNat Zero (NilNat)


lengthOfListNat NilNat  = Zero
lengthOfListNat (ConsNat _ x)  = Succ (lengthOfListNat x)


data ListBool = NilBool | ConsBool Bool ListBool deriving Show

exampleListBool = ConsBool True (ConsBool False NilBool)

lengthOfListBool NilBool  = Zero
lengthOfListBool (ConsBool _ y) = Succ (lengthOfListBool y)


-- ... this get's very tiresome

data List a = Nil | Cons a (List a) deriving Show -- where a means anything

exampleList = Cons Red (Cons Green Nil)

length Nil = Zero
length (Cons _ x) = Succ (length x)

-- data StudentYear = Freshman | Sophomore | Junior | Senior deriving Show -- where a means anything

exampleStudentYear = Freshman

-- write an function that shows how many years a student is expected to graduate.  For instance a Sophomore is expected to graduate in 3 years.
expectedYearsToGraduate Freshman = Succ three
expectedYearsToGraduate Senior = Succ Zero
expectedYearsToGraduate Junior = Succ (expectedYearsToGraduate Senior)
expectedYearsToGraduate Sophomore = three

data Maybe a | Nothing | Just a deriving Show


-- how can we write the inverse?
fromExpectedYearsToGraduate (Succ Zero) = Just Senior
fromExpectedYearsToGraduate (Succ (Succ Zero)) = Just Junior
fromExpectedYearsToGraduate (Succ (Succ (Succ Zero))) = Just Sophomore
fromExpectedYearsToGraduate (Succ (Succ (Succ (Succ Zero)))) = Just Freshman
fromExpectedYearsToGraduate _ = Nothing




-- what is the smallest datatype you can come up with?
-- data Smallests = Yes | No deriving Show

-- exampleSmallest = No



-- what is the crazieset datatype you can come up with?
data Craziests a = Wayne Bool StudentYear Stoplight
				| Mark (Craziests a) (Craziests a) (Craziests a)
				| Lemay (List Bool) (List (Craziests a))
				| Snyder (List a)
				| Attarwala (List Stoplight)
				| Matta (Craziests a) StudentYear

				deriving Show

exampleCraziests = Wayne True Sophomore Red
