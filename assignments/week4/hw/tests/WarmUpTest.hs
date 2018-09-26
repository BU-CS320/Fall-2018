module WarmUpTest where 

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import WarmUp(NonEmptyList, example, len)


unitTests =
  testGroup
    "WarmUpTest"
    []
    

