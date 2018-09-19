module OutsideTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Outside(exampleSet, eqSet, exampleBst, onlyHasEven)

unitTests =
  testGroup
    "Outside"
    []

	
	