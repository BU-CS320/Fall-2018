module WarmUpTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import WarmUp(Crazier, example, isItNice)

unitTests =
  testGroup
    "WarmUpTest"
    []