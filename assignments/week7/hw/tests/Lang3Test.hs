module Lang3Test where

import Data.Char
import Data.List

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang3(Ast(AstInt,Plus,Separator,Assign,Id), eval)



unitTests =
  testGroup
    "Lang3Test"
    [
     -- TODO: your tests here
    ]




-- TODO: add a generator, test other Eq laws too, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always at least parse show





-- test1 :: Bool
-- test1 = eval empty ("x" `Assign` (AstInt 3))
--         == (fromList [("x",3)], Just 3)
--
--
-- test2 :: Bool
-- test2 = snd (eval empty                ("x" `Assign` ((AstInt 3) `Plus` (Id  "x"))))
--         /=
--         snd (eval (fromList [("x",3)]) ("x" `Assign` ((AstInt 3) `Plus` (Id  "x"))))
--
-- test3 :: Bool
-- test3 = (snd (eval empty ((("x" `Assign` (AstInt 3)) `Plus` (Id  "x")) `Plus` ( ("x" `Assign` (AstInt 4)) `Plus` (Id  "x"))    ) ))
--             == Just 14
-- test1 :: Bool
-- test1 = eval empty  (unsafeParser " x = 3 ") == (fromList [("x",3)],Just 3)
--
-- test2 :: Bool
-- test2 = snd (eval empty  (unsafeParser " x = 3 + x "))
--         /=
--         snd (eval (fromList [("x",3)]) (unsafeParser " x = 3 + x "))
--
--
-- test3 :: Bool
-- test3 = snd (eval empty  (unsafeParser " (x = 3) + x + ((x = 4) + x) ") ) == Just 14

-- test4 = parser " x = (3+5) ; y = x+x; x+y+7" == Just (Assign "x" (Separator (Plus (AstInt 3) (AstInt 5)) (Assign "y" (Separator (Plus (Id "x") (Id "x")) (Plus (Id "x") (Plus (Id "y") (AstInt 7)))))),"")
