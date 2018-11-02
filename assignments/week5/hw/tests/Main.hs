module Main where

import Test.Tasty (defaultMain, testGroup)


import WarmUpTest
import Lang0Test
import Lang1Test
import Lang2Test
import Lang3Test
import Lang4Test
import HigherOrderProblemsTest
import TypeclassProblemsTest

main = defaultMain testSuite


testSuite =
  testGroup
    "allTests"
    [WarmUpTest.unitTests,
	 Lang0Test.unitTests,
	 Lang1Test.unitTests,
	 Lang2Test.unitTests,
	 Lang3Test.unitTests,
	 Lang4Test.unitTests,
	 HigherOrderProblemsTest.unitTests,
	 TypeclassProblemsTest.unitTests
    ]
