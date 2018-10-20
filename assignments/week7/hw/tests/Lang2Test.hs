module Lang2Test where


import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang2(Ast(AstInt,Plus,Separator,Print), eval)
import Lang2Parser(unsafeParser, parser)



unitTests =
  testGroup
    "Lang2Test"
    [instructorTests,
     -- TODO: your tests here
     parseShowTests]


instructorTests = testGroup
      "instructorTests"
      [
      testCase "print(2); 3" $ assertEqual []  (3,[2]) $ eval (unsafeParser "print(2); 3") ,
      testCase "print(print(2) + print(3))" $ assertEqual []  (5,[2,3,5]) $ eval (unsafeParser "print(print(2) + print(3))") ,

      testCase " 4+ print(5+2); 7+3" $ assertEqual []  (Just (Separator (Plus (AstInt 4) (Print (Plus (AstInt 5) (AstInt 2)))) (Plus (AstInt 7) (AstInt 3)),"")) $ parser " 4+ print(5+2); 7+3"
      ]

-- TODO: add a generator, every show should be parsable, test the Eq laws, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always be able to parse show

parseShowTests = testGroup
      "parseShowTests"
      [
      testCase "test parsing show AstInt" $ assertEqual [] (Just ((AstInt 2), "")) $ (parser (show (AstInt 2))),

      testCase "test parsing show Plus" $ assertEqual [] (Just ((Plus (AstInt 2) (AstInt 3)),"")) $ (parser (show (Plus (AstInt 2) (AstInt 3)))),
      
      testCase "test parsing show Separator" $ assertEqual [] (Just ((Separator (AstInt 2) (AstInt 3)),"")) $ (parser (show (Separator (AstInt 2) (AstInt 3)))),

      testCase "test parsing show Print" $ assertEqual [] (Just ((Print (AstInt 2)), "")) $ (parser (show (Print (AstInt 2))))
      ]