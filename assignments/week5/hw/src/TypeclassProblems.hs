module TypeclassProblems where

-- define data type for all 7 days of the week
data DayOfTheWeek -- = ...

-- often built-in haskell classes come with nice syntax, when the following is defined try this 
-- in the console [Monday .. Friday]

instance Enum DayOfTheWeek where
  --toEnum :: Integer -> DayOfTheWeek (start counting at 0)
  toEnum 0 = undefined
  toEnum 1 = undefined
  toEnum 2 = undefined
  toEnum 3 = undefined
  toEnum 4 = undefined
  toEnum 5 = undefined
  toEnum 6 = undefined
  
  --fromEnum :: DayOfTheWeek -> Integer
  fromEnum _ = undefined


-- First we will work with a custom type class that makes an example of a type

class HasExample a where
  example :: a

-- finish up the instances on these types
instance HasExample DayOfTheWeek where
  example = undefined


instance HasExample Bool where
  example = undefined
  
instance HasExample Integer where
  example = undefined

instance HasExample [a] where
  example = undefined
  
instance (HasExample a, HasExample b) => HasExample (a,b) where
  example = undefined

instance HasExample b => HasExample (a -> b) where
  example = undefined
  
iSureWishIHadThisFunction :: Integer -> Bool -> (a ->b ) -> (Integer, (Bool, DayOfTheWeek))
iSureWishIHadThisFunction = example -- it's a little silly but the code is automatically generated!


-- next we will work with a custom type class that gives all the things

class AllTheThings a where
  listOfAll :: [a]
-- laws: finite, no repeat

-- when we have this defined we can check that ALL inputs of a function are correct
forAll :: AllTheThings a => (a -> Bool) -> Bool
forAll f = all f listOfAll


instance AllTheThings Bool where
  listOfAll = undefined

  
boolEq  :: Bool -> Bool
boolEq = (\b  -> b == b)

--try "forAll boolEq" in the console!

-- finish up the instances on these types
instance AllTheThings DayOfTheWeek where
  listOfAll = undefined
  

instance (AllTheThings a, AllTheThings b) => AllTheThings (a,b) where
  listOfAll = undefined


  
-- Bonus challenge problems! (you will not be graded on these)
  
instance (AllTheThings a, Eq a, AllTheThings b) => AllTheThings (a -> b) where
  listOfAll = undefined

instance (AllTheThings a, Show a, Show b) => Show (a -> b) where
  show f = undefined
