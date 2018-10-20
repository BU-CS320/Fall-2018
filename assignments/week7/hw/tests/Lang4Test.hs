module Lang4Test where

import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang4(Ast(AstInt,Plus,Separator,Let,Id), eval)
import Lang4Parser(unsafeParser, parser)



unitTests =
  testGroup
    "Lang4Test"
    [instructorTests
     -- TODO: your tests here
    ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "example eval" $ assertEqual []  (Just 6) $ eval empty (Let "x" (AstInt 3) ((Id "x") `Plus` (Id "x")) ) ,

      testCase "example eval" $ assertEqual []  (Just 5) $ eval empty (Let "x" (AstInt 3)
                                                                          ((Let "x" (AstInt 1)
                                                                           ((Id "x") `Plus` (Id "x")))  `Plus` (Id "x")) ),

      testCase "parse test: let x= 3+3 in x; (let y = x + 7 in x + y)+x" $ assertEqual []
                                              (Just (Let "x" (Plus (AstInt 3) (AstInt 3)) (Separator (Id "x") (Plus (Let "y" (Plus (Id "x") (AstInt 7)) (Plus (Id "x") (Id "y"))) (Id "x"))),"")) $
                                             parser "let x= 3+3 in x; (let y = x + 7 in x + y)+x",

      testCase "parse test: let x = 3 in x+x" $ assertEqual []
                                             (Just 6) $
                                             eval empty  (unsafeParser " let x = 3 in x+x"),

      testCase "parse test:  let x = 3 in (let x= 1 in x+x) + x" $ assertEqual []
                                             (Just 5) $
                                              eval empty  (unsafeParser " let x = 3 in (let x= 1 in x+x) + x")
      ]

-- TODO: add a generator, every show should be parsable, test the Eq laws, tests from prevous languages and week 5, many many more examples
-- TODO: you should always be able to parse show (when the var names aren't too bad)

