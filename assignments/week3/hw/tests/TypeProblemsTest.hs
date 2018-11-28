module TypeProblemsTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import TypeProblems(Answer(..), q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17)
import Data.Bits
import Data.Char
import Data.Maybe

unitTests =
  testGroup
    "TypeProblems"
    [differentQ6Q7,differentQ8Q9]

-- for simple stuff
instance Eq a => Eq (Answer a) where
  Impossible == Impossible = True
  (Example x) == (Example y) = x == y
  _ == _ = False

checkDifferent :: (Answer a) -> (Answer a) -> (a -> a -> Bool) -> Bool
checkDifferent Impossible _ _ = True
checkDifferent _ Impossible _ = True
checkDifferent (Example x) (Example y) f = f x y


differentQ6Q7 =
    testCase "q6 different than q7 (different functions take one same input to differnt outputs)" $ assertBool [] $ checkDifferent q6 q7 (\a1 a2 -> a1 () /= a2 ())
differentQ8Q9 =
    testCase "q8 different than q8 (different functions take one same input to differnt outputs)" $ assertBool [] $ checkDifferent q8 q9 (\a1 a2 -> a1 True False /= a2 True False )


--unfortunately pretty much any other test gives away the answers
