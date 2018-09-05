module Main where
import Greeting

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

main = defaultMain unitTests

unitTests =
  testGroup
    "greetingTest"
    [greetingTest, identTest]



-- an empty greeting is no good
greetingTest =
  testCase "the greeting should not be empty" $ assertBool [] (length greeting /= 0)

-- test that ident works
identTest =
  testCase "the ident function should work" $ assertEqual [] greeting (ident greeting)
