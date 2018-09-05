module Main where
import Greeting

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

main = defaultMain unitTests

unitTests =
  testGroup
    "greetingTest"
    [greetingTest
    , identTest
    ]

-- an empty greeting is no good
greetingTest =
  testCase "the greeting should not be empty" $ assertBool [] (length greeting /= 0)


-- an incorrect identity function is no good
identTest =
  testCase "the identity function should not be undefined" $ assertBool [] (ident greeting == greeting)