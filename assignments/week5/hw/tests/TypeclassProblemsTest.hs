module TypeclassProblemsTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty )

import TypeclassProblems(DayOfTheWeek, iSurewhishIHadThisFunction, forAll, boolEq)


unitTests =
  testGroup
    "TypeclassProblemsTest"
    []
    