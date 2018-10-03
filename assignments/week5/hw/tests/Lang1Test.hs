module Lang1Test where

import Data.Char

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang1(Ast(AstInt,Plus,Separator), eval)



unitTests =
  testGroup
    "Lang1Test"
    [showPlusWorks,
	 showSeperatorWorks] 

removeSpaces :: String -> String
removeSpaces [] = []
removeSpaces (h:t) | isSpace h  = removeSpaces t
                   | otherwise  = h : removeSpaces t
	
showPlusWorks = testCase "show should show the pre evaluated expression" $
              assertEqual [] (removeSpaces "1 + 2") $ removeSpaces $ show $ (AstInt 1) `Plus` (AstInt 2)

showSeperatorWorks = testCase "Separator should be ;" $
              assertEqual [] (removeSpaces "1 ; 2") $ removeSpaces $ show $ (AstInt 1) `Separator` (AstInt 2)

