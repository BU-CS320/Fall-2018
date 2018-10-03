module HigherOrderProblemsTest where


import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(problemA,solutionA,problemB,solutionB, problemC, solutionC,problemD,solutionD,problemE,solutionE,problemF,solutionF, length, append, longest, flatten, remove, average)
import AnnoyingLists


unitTests =
  testGroup
    "HigherOrderProblemsTest"
    [exampleTest]

-- this is a little hacky but will be good enough for tests
instance Show a => Eq (AnnoyingList a) where
  x == y  = (show x) == (show y)

exampleTest = testCase "solutionA adds 1 to each number" $
              assertEqual [] (fromList [1,2,3]) $ solutionA $ fromList [0,1,2]

