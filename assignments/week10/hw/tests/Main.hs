module Main where

import Test.Tasty

import LangParserTest
import EvalUnsafeTest


main = defaultMain testSuite

--TODO: figure out how to set the timeout

testSuite =
  testGroup
    "allTests"
    [
        LangParserTest.unitTests,
        EvalUnsafeTest.unitTests
    ]
