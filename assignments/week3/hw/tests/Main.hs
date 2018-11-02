module Main where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import DataProblemsTest
import TypeProblemsTest
import SetTest
import BinarySearchTreesTest
import OutsideTest
import HigherOrderProblemsTest
import WarmUpTest


main = defaultMain allTests

allTests =
  testGroup
    "allTests"
    [
     BinarySearchTreesTest.unitTests,
     DataProblemsTest.unitTests,
     HigherOrderProblemsTest.unitTests,
     OutsideTest.unitTests,
     SetTest.unitTests,
     TypeProblemsTest.unitTests,
     WarmUpTest.unitTests
     ]
