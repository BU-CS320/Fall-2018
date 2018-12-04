module Main where

import Test.Tasty



import IcInterpreterTest
import AstInterperterTests
import CompilerTests
import FeaturesTests
import ParserTests

main = defaultMain testSuite

--TODO: figure out how to set the timeout

testSuite =
  testGroup
    "allTests"
    [
        IcInterpreterTest.unitTests,
        AstInterperterTests.unitTests,
        CompilerTests.unitTests,
        FeaturesTests.unitTests,
        ParserTests.unitTests
    ]
