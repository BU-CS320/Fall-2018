module Main where

import Test.Tasty

import LangParserTest
import LangTest
import EvalUnsafeTest

main = defaultMain testSuite

--TODO: figure out how to set the timeout

testSuite =
  testGroup
    "allTests"
    [
        EvalUnsafeTest.unitTests,
        LangTest.unitTests,
        LangParserTest.unitTests
    ]
