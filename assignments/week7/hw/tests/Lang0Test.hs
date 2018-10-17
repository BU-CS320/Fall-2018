module Lang0Test where

import Data.Char

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import Lang0(Ast(AstInt,Plus), eval)
import Lang0Parser(unsafeParser, parser)

-- if some hero wants to write these for all data, I'm sure the class will appreciate it!
instance Arbitrary Ast where
    arbitrary = sized arbitrarySizedAst

arbitrarySizedAst ::  Int -> Gen Ast
arbitrarySizedAst m | m < 1     = do i <- arbitrary
                                     return $ AstInt i
arbitrarySizedAst m | otherwise = do l <- arbitrarySizedAst (m `div` 2)
                                     r <- arbitrarySizedAst (m `div` 2)
                                     return $ Plus l r
-- See: https://www.stackbuilders.com/news/a-quickcheck-tutorial-generators



unitTests =
  testGroup
    "Lang0Test"
    [instructorTests
     -- TODO: your tests here
	 ]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "show should show the pre evaluated expression" $ assertEqual []  "(1+2)" $ show $ (AstInt 1) `Plus` (AstInt 2),
      testProperty "show is never empty" $ ((\ x -> 0 < (length $ show x)) :: Ast -> Bool),
      testProperty "for all x. x == x" $ ((\ x -> x == x) :: Ast -> Bool),
      testCase "eval ((AstInt 2) `Plus` (AstInt 3)) == 5" $ assertEqual [] 5 $ eval ((AstInt 2) `Plus` (AstInt 3)),

      testCase "testParser1" $ assertEqual [] (eval (unsafeParser "5")) $ eval (unsafeParser "2 + 3"),
      testCase "testParser2" $ assertEqual [] (Just (Plus (AstInt 1) (Plus (AstInt 2) (Plus (AstInt 3) (Plus (AstInt 4) (Plus (AstInt 5) (AstInt 6))))),"")) $ (parser "1+2+3+4+5+6"),
      testCase "testParser3" $ assertEqual [] (Just (Plus (AstInt 1) (Plus (AstInt 2) (Plus (Plus (AstInt 3) (AstInt 4)) (Plus (AstInt 5) (AstInt 6)))),"")) $ (parser "1+2+(3+((4)))+5+6" ),

      testProperty "show should match parse" $ ((\ x -> Just (x , "") == (parser $ show x)) :: Ast -> Bool)
      ]


-- TODO: test other Eq laws too, better descriptions


