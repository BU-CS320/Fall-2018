module HigherOrderProblemsTest where


import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import HigherOrderProblems(sumsqa, remdups, inits)


unitTests =
  testGroup
    "HigherOrderProblemsTest"
    [test_sumsqaEx,
     test_remdupsEx,
     test_initsEx,
     test_sumsqa0,
     test_inits0,
     test_remdups0]


test_sumsqaEx =
  testCase "sum of square of 1 to 4 should be 30" $ assertEqual [] 30 (sumsqa [1..4])


test_remdupsEx =
  testCase "remove adjacent duplicate" $ assertEqual [] [1,2,3,1] (remdups [1,2,2,3,3,3,1,1])


test_initsEx =
  testCase "should print all letters starting with empty string" $ assertEqual [] ["", "c", "cs", "cs3", "cs32", "cs320"] (inits "cs320")


test_sumsqa0 =
  testCase "sum of nothing should be zero" $ assertEqual [] 0 (sumsqa [])


test_inits0 =
  testCase "only have substring empty string" $ assertEqual [] [""] (inits [])


test_remdups0 =
  testCase "no adjacent duplicates, should return input" $ assertEqual [] ['h','a', 'p', 'y', 'l', 'o', 'n', 'g', 'w', 'e', 'n', 'k', 'e', 'n', 'd'] (remdups ['h', 'a', 'p', 'y', 'l', 'o', 'n', 'g', 'w', 'e', 'n', 'k', 'e', 'n', 'd'])