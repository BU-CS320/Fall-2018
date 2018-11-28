module DataProblemsTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import DataProblems(Deserts, favorite, dontLike, willILikeIt, Student, me, mkStudent)

import Data.Maybe

unitTests =
  testGroup
    "DataProblems"
    [
     ex1willILikeIt,
     ex1willILikeNot,
     correctInvalidStudent,
     canMakeSomeStudents
    ]

ex1willILikeIt =
  testCase "favorite should be true" $ assertBool [] (willILikeIt favorite)

ex1willILikeNot =
  testCase "dontLike should be false" $ assertBool [] (not (willILikeIt dontLike))

-- mkstudent year= -12930454 should be None
correctInvalidStudent =
  testCase "Correct Invalid Student" $ assertBool [] (isNothing (mkStudent "a" "b" "1243423" (-12930454)))

-- there are cleaner ways to do this
someStudents :: [Student]
someStudents = map (\ (Just s) -> s) $ filter isJust $ map (\ i -> (mkStudent "a" "b" "1243423" (i))) [0..3000]

canMakeSomeStudents =
  testCase "Can make some students" $ assertBool [] (0 /= length someStudents)