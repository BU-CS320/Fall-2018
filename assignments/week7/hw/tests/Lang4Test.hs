module Lang4Test where

import Data.Char
import Data.List

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang4(Ast(AstInt,Plus,Separator,Let,Id), eval)



unitTests =
  testGroup
    "Lang4Test"
    [
     -- TODO: your tests here
    ]




-- TODO: add a generator, test other Eq laws too, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always at least parse show


-- test1 :: Bool
-- test1 = eval empty (Let "x" (AstInt 3)
--                     ((Id "x") `Plus` (Id "x")) )
--         == Just 6
--
-- test2 :: Bool
-- test2 = eval empty (Let "x" (AstInt 3)
--                     ((Let "x" (AstInt 1)
--                      ((Id "x") `Plus` (Id "x")))  `Plus` (Id "x")) )
--         == Just 5

-- test3 = parser "let x= 3+3 in x; (let y = x + 7 in x + y)+x" == Just (Let "x" (Plus (AstInt 3) (AstInt 3)) (Separator (Id "x") (Plus (Let "y" (Plus (Id "x") (AstInt 7)) (Plus (Id "x") (Id "y"))) (Id "x"))),"")
--
--
-- test1 :: Bool
-- test1 = eval empty  (unsafeParser " let x = 3 in x+x") == Just 6
--
--
-- test2 :: Bool
-- test2 = eval empty  (unsafeParser " let x = 3 in (let x= 1 in x+x) + x") == Just 5