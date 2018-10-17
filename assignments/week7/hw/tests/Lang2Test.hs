module Lang2Test where

import Data.Char
import Data.List

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang2(Ast(AstInt,Plus,Separator,Print), eval)



unitTests =
  testGroup
    "Lang2Test"
    [
     -- TODO: your tests here
    ]




-- TODO: add a generator, test other Eq laws too, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always at least parse show


-- TODO:
-- test3 = parser " 4+ print(5+2); 7+3" == Just (Separator (Plus (AstInt 4) (Print (Plus (AstInt 5) (AstInt 2)))) (Plus (AstInt 7) (AstInt 3)),"")
--
-- test1 :: Bool
-- test1 = eval (unsafeParser "print(2); 3") == (3,[2])
--
--
-- test2 :: Bool
-- test2 = eval (unsafeParser "print(print(2) + print(3))") == (5,[2,3,5])
