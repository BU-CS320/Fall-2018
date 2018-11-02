module Main where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)


import WarmUpTest
import HigherOrderProblemsTest
import IndexTreeBadTest
import IndexTreeTest
import IndexAndConcordanceTest
import TypeclassProblemsTest


main = defaultMain allTests

allTests =
  testGroup
    "allTests"
    [WarmUpTest.unitTests,
     HigherOrderProblemsTest.unitTests,
     IndexTreeBadTest.unitTests,
     IndexTreeTest.unitTests,
	 IndexAndConcordanceTest.unitTests,
	 TypeclassProblemsTest.unitTests
    ]
