module HigherOrderProblemsTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(returnEven, repeat10Times, toNameYear)
import DataProblems(Student, me, mkStudent)


unitTests =
  testGroup
    "HigherOrderProblems"
    []
