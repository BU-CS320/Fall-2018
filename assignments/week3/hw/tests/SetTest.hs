module SetTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Set

unitTests =
  testGroup
    "Set"
    [emptySetNot9]

	
	
emptySetNot9 =
  testCase "empty set doesn't contain 9" $ assertBool [] (not (contains empty 9))