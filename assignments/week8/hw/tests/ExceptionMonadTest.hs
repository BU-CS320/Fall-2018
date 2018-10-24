module ExceptionMonadTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import ExceptionMonad (Unsafe(Error, Ok))

unitTests =
  testGroup
    "ExceptionMonadTest"
    [instructorTests
     -- TODO: your tests here!!!
	 ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "return test " $ assertEqual [] (Ok 0) $ return 0,
      testCase "return test " $ assertEqual [] (Ok 5) $ return 5
      ]


-- TODO: your tests here!!!
-- TODO: Lots of tests for all the laws!