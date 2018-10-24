module ParserMonadTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import ParserMonad(Parser(Parser),parse,(+++), literal, varParser)

unitTests =
  testGroup
    "ParserMonadTest"
    [instructorTests
     -- TODO: your tests here
	 ]

instructorTests = testGroup
      "instructorTests"
      [testCase "+++ test" $ assertEqual []  (Just (("abc","123"),"")) $ parse ( (literal "abc") +++ (literal "123") ) "abc123",
       testCase "+++ test" $ assertEqual []  Nothing $ parse ( (literal "abc") +++ (literal "123") ) "abcd123",
       testCase "varParser test" $ assertEqual []  (Just ("abc","")) $ parse varParser "abc"
      ]


-- TODO: your tests here!!!
-- TODO: Lots of tests for all the laws!
-- TODO: some more tests for: varParser, +++, both success and failure