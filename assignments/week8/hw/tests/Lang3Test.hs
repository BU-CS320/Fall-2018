module Lang3Test where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import Lang3(Ast(AstInt ,Id , Plus, Assign , Separator), eval)
import StateMonad

unitTests =
  testGroup
    "Lang3Test"
    [instructorTests
     -- TODO: your tests here!!!
	 ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "example eval, assign also returns it's value" $ assertEqual []  (3, fromList [("x",3)]) $ app (eval ("x" `Assign` (AstInt 3))) empty,
      testCase "example eval on different states" $ assertBool []   $ fst (app (eval    ("x" `Assign` ((AstInt 3) `Plus` (Id  "x")))) empty)
                                                                      /=
                                                                      fst (app (eval ("x" `Assign` ((AstInt 3) `Plus` (Id  "x")))) (fromList [("x",3)])),

      testCase "state is handled across addition" $ assertEqual [] (14) $ (fst (app (eval ((("x" `Assign` (AstInt 3)) `Plus` (Id  "x")) `Plus` ( ("x" `Assign` (AstInt 4)) `Plus` (Id  "x")) ) ) empty ) )

      ]


-- TODO: your tests here!!!
-- TODO: Many, many more example test cases (every simple thing, many normal things, some extreame things)
-- TODO: add a generator, can then test more advanced language properties
-- TODO: you should always be able to parse show (when the var names aren't too bad)