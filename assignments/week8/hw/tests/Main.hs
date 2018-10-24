module Main where

import Test.Tasty

import ArithTest
import ExceptionMonadTest
import Lang3Test
import ParserMonadTest

main = defaultMain testSuite

--TODO: figure out how to set the timeout

testSuite =
  testGroup
    "allTests"
    [
        ArithTest.unitTests,
        ExceptionMonadTest.unitTests,
        Lang3Test.unitTests,
        ParserMonadTest.unitTests
    ]
