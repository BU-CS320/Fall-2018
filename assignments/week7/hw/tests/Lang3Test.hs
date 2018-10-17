module Lang3Test where

import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang3(Ast(AstInt,Plus,Separator,Assign,Id), eval)
import Lang3Parser(unsafeParser, parser)




unitTests =
  testGroup
    "Lang3Test"
    [instructorTests
     -- TODO: your tests here
    ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "example eval" $ assertEqual []  (fromList [("x",3)], Just 3) $ eval empty ("x" `Assign` (AstInt 3)) ,
      testCase "example eval on different states" $ assertBool []   $ snd (eval empty   ("x" `Assign` ((AstInt 3) `Plus` (Id  "x"))))
                                                         /=
                                                         snd (eval (fromList [("x",3)]) ("x" `Assign` ((AstInt 3) `Plus` (Id  "x")))) ,

      testCase "example eval" $ assertEqual [] (Just 14) $ (snd (eval empty ((("x" `Assign` (AstInt 3)) `Plus` (Id  "x")) `Plus` ( ("x" `Assign` (AstInt 4)) `Plus` (Id  "x"))    ) )) ,

      testCase "parse test:  x = 3 " $ assertEqual [] (fromList [("x",3)],Just 3) $ eval empty  (unsafeParser " x = 3 ") ,
      testCase "parse test  on different states" $ assertBool []  $ snd (eval empty  (unsafeParser " x = 3 + x "))
                                                      /=
                                                      snd (eval (fromList [("x",3)]) (unsafeParser " x = 3 + x ")),
      testCase "parse test  (x = 3) + x + ((x = 4) + x) " $ assertEqual [] (Just 14) $ snd (eval empty  (unsafeParser " (x = 3) + x + ((x = 4) + x) ") ) ,
      testCase "parse test  x = (3+5) ; y = x+x; x+y+7 " $ assertEqual [] (Just (Assign "x" (Separator (Plus (AstInt 3) (AstInt 5)) (Assign "y" (Separator (Plus (Id "x") (Id "x")) (Plus (Id "x") (Plus (Id "y") (AstInt 7)))))), "")) $ parser " x = (3+5) ; y = x+x; x+y+7"
      ]

-- TODO: add a generator, every show should be parsable, test the Eq laws, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always be able to parse show (when the var names aren't too bad)

