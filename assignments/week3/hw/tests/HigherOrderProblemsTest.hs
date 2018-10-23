module HigherOrderProblemsTest where

import Data.Maybe

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(returnEven, repeat10Times, toNameYear)
import DataProblems(Student, me, mkStudent)


unitTests =
  testGroup
    "HigherOrderProblems"
    [
     test1ToNameYear,
     test2ToNameYear,
     test3ToNameYear,
     test1Repeat10Times,
     test2Repeat10Times,
     test1IsEven
    ]

-- there are cleaner ways to do this
someStudents :: [Student]
someStudents = map (\ (Just s) -> s) $ filter isJust $ map (\ i -> (mkStudent "a" "b" "1243423" (i))) [0..3000]

--test that they didn't break our template
test1ToNameYear =
  testCase "returns a list with the same length" $ assertEqual [] 3 (length $ toNameYear [me,me,me])

test2ToNameYear =
  testCase "returns a list with the same name in the tuple" $ assertBool [] $ all (\ (a, _) -> a == "a b") $ toNameYear (take 3 someStudents)

test3ToNameYear =
  testCase "returns a list with the same year in the tuple" $ assertBool [] $ all (\ (_, i) -> i >= 0) $ toNameYear (take 3 someStudents)

exampleString :: [String]
exampleString = ["aaa", "bbb", "ccc"]

test1Repeat10Times =
    testCase "returns the list with 10 times its length" $ assertEqual [] ((length exampleString) * 10) (length (repeat10Times exampleString))

test2Repeat10Times =
    testCase "returns the lists with 10 times each of its elements" $ assertEqual [] (foldl (\x y -> x ++ (replicate 10 y)) [] exampleString) (repeat10Times exampleString)

test1IsEven =
    testCase "returns only even numbers" $ assertEqual [] [2, 4, 6] (returnEven [1,2,3,4,5,6])
