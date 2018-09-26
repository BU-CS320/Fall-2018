module HigherOrderProblemsTest where


import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(problemA,solutionA,problemB,solutionB, problemC, solutionC,problemD,solutionD,problemE,solutionE,problemF,solutionF, length, append, longest, flatten, remove, average)
import AnnoyingLists


unitTests =
  testGroup
    "HigherOrderProblemsTest"
    []
    
