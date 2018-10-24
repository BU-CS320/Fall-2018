module ExceptionMonadTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import ExceptionMonad (Unsafe(Error, Ok),listProb)

unitTests =
  testGroup
    "ExceptionMonadTest"
    [instructorTests
     -- TODO: your tests here!!!
	 ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "listProb works on 1 " $ assertEqual [] (Ok 0) $ listProb [Ok 0, Ok 0],
      testCase "listProb works on 1 " $ assertEqual [] (Ok 5) $ listProb [Ok 0, Ok 2, Ok 3, Ok 0]
      ]


-- TODO: your tests here!!!
-- TODO: Lots of tests for all the laws!
-- TODO: many more examples of the list problem