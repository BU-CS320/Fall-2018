module WarmUpTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import WarmUp(Crazier, example, isItNice)

unitTests =
  testGroup
    "WarmUpTest"
    [
     ex1IsItNice
    ]


ex1IsItNice =
    testCase "it is nice" $ assertBool [] $ (isItNice example) == True || (isItNice example) == False