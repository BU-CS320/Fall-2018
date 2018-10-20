module Lang1Test where

import Data.Char

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import Lang1(Ast(AstInt,Plus,Separator), eval)
import Lang1Parser(unsafeParser, parser)

-- if some hero wants to write these for all data, I'm sure the class will appreciate it!
instance Arbitrary Ast where
    arbitrary = sized arbitrarySizedAst

arbitrarySizedAst ::  Int -> Gen Ast
arbitrarySizedAst m | m < 1     = do i <- arbitrary
                                     return $ AstInt i
arbitrarySizedAst m | otherwise = do l <- arbitrarySizedAst (m `div` 2)
                                     r <- arbitrarySizedAst (m `div` 2)
                                     op <- elements [Plus, Separator]
                                     return $ op l r
-- See: https://www.stackbuilders.com/news/a-quickcheck-tutorial-generators

unitTests =
  testGroup
    "Lang1Test"
    [instructorTests
     -- TODO: your tests here
	 ]



instructorTests = testGroup
      "instructorTests"
      [
      testCase "show should show the pre evaluated expression" $ assertEqual []  "(1+2)" $ show $ (AstInt 1) `Plus` (AstInt 2),
      testCase "Separator should be ;" $ assertEqual []  "(1;2)" $ show $ (AstInt 1) `Separator` (AstInt 2),
      testProperty "show is never empty" $ ((\ x -> 0 < (length $ show x)) :: Ast -> Bool),
      testProperty "for all x. x == x" $ ((\ x -> x == x) :: Ast -> Bool),
      testCase "eval ((AstInt 2) `Plus` (AstInt 3)) == 5" $ assertEqual [] 5 $ eval ((AstInt 2) `Plus` (AstInt 3)),

      testCase "testParser1" $ assertEqual [] (eval (unsafeParser "5")) $ eval (unsafeParser "2 + 3"),
      testCase "testParser2" $ assertEqual [] (Just (Plus (AstInt 1) (Plus (AstInt 2) (Plus (AstInt 3) (Plus (AstInt 4) (Plus (AstInt 5) (AstInt 6))))),"")) $ (parser "1+2+3+4+5+6"),
      testCase "testParser3" $ assertEqual [] (Just (Plus (AstInt 1) (Plus (AstInt 2) (Plus (Plus (AstInt 3) (AstInt 4)) (Plus (AstInt 5) (AstInt 6)))),"")) $ (parser "1+2+(3+((4)))+5+6" ),

      testProperty "show should match parse" $ ((\ x -> Just (x , "") == (parser $ show x)) :: Ast -> Bool),

      testCase "test" $ assertEqual [] 3 $ eval ((AstInt 2) `Separator` (AstInt 3)),

      testCase "test" $ assertEqual [] (eval (unsafeParser "5")) $ eval (unsafeParser "2 + 3"),
      testCase "test" $ assertEqual [] (eval (unsafeParser "3")) $ eval (unsafeParser "2 ; 3"),
      testCase "1+2; (4+5;6+7)+ 8" $ assertEqual [] (Just (Separator (Plus (AstInt 1) (AstInt 2)) (Plus (Separator (Plus (AstInt 4) (AstInt 5)) (Plus (AstInt 6) (AstInt 7))) (AstInt 8)),"")) $ parser "1+2; (4+5;6+7)+ 8"

      ]



-- TODO: test other Eq laws too, better descriptions, many many more examples


