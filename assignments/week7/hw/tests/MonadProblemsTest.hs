module MonadProblemsTest  where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary)


import MonadProblems(NotLI,aNum, aFunc, NotAs, mNum, kFun, hFun)


unitTests =
  testGroup
    "MonadProblemsTest"
    [instructorTests
-- TODO: your tests here
    ]

instructorTests = testGroup
      "instructorTests"
      [
  testCase "broke the left id law" $ assertBool [] $ (return aNum >>= aFunc) /=  (aFunc aNum),
  testCase "broke the associative law)" $ assertBool [] $ (mNum >>= (\x -> kFun x >>= hFun)) /=  ((mNum >>= kFun) >>= hFun)
      ]

-- TODO: test that equality is correctly defined for "return aNum", aNum aFunc, ...
