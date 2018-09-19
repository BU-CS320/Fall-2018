module DataProblemsTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import DataProblems(Deserts, favorite, dontLike, willILikeIt, Student, me, mkStudent)

unitTests =
  testGroup
    "DataProblems"
    []
	
	