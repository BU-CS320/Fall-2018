module Main where

import Test.Tasty (defaultMain, testGroup)


import InfiniteListsTest
import UsingLambdaCalcTest
import LambdaCalcImplementationTest

main = defaultMain testSuite


testSuite =
  testGroup
    "allTests"
    [InfiniteListsTest.unitTests,
    UsingLambdaCalcTest.unitTests,
    LambdaCalcImplementationTest.unitTests
    ]
