module HigherOrderProblemsTest where


import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(sumsqa, remdups, inits)


unitTests =
  testGroup
    "HigherOrderProblemsTest"
    []
    
