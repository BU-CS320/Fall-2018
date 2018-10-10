module Main where

import Test.Tasty (defaultMain, testGroup)


import InfiniteListsTest
import UsingLambdaCalcTest

main = defaultMain testSuite


testSuite =
  testGroup
    "allTests"
    [InfiniteListsTest.unitTests,
    UsingLambdaCalcTest.unitTests
    ]
