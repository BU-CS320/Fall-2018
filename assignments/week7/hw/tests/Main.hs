module Main where

import Test.Tasty

import MonadProblemsTest
import Lang0Test
import Lang1Test
import Lang2Test
import Lang3Test
import Lang4Test

main = defaultMain testSuite

--TODO: figure out how to set the timeout

testSuite =
  testGroup
    "allTests"
    [    MonadProblemsTest.unitTests,
	 Lang0Test.unitTests,
	 Lang1Test.unitTests,
	 Lang2Test.unitTests,
	 Lang3Test.unitTests,
	 Lang4Test.unitTests
    ]
