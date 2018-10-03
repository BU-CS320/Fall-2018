module WarmUpTest where 

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty )

import WarmUp(biggerNumber)

-- make pull requests for what we cover in lab!

unitTests =
  testGroup
    "WarmUpTest"
    [biggerNumberTest1, biggerNumberPropertyTest] -- put tests in this list, so [testName, testName2]

-- write a nice comment here
-- testName =
--  testCase "put a nice description here" $ assertBool [] $ undefined

-- assert Bool means it is true
biggerNumberTest1 =
  testCase "output has to be greater than input (1)" $ assertBool [] $ biggerNumber 1 > 1



-- Can we do better?



--testName2 =
--  testProperty "put a nice description here" $ undefined

propertyFun :: Integer -> Bool
propertyFun x = biggerNumber x > x

biggerNumberPropertyTest =
  testProperty "output always has to be greater than input" $ propertyFun

