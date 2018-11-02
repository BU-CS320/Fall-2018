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
    [showPlusWorks,
	 showSeperatorWorks,
	 showLetWorks,
	 showIdWorks
	 ] 

removeSpaces :: String -> String
removeSpaces [] = []
removeSpaces (h:t) | isSpace h  = removeSpaces t
                   | otherwise  = h : removeSpaces t
	
showPlusWorks = testCase "show should show the pre evaluated expression" $
              assertEqual [] (removeSpaces "1 + 2") $ removeSpaces $ show $ (AstInt 1) `Plus` (AstInt 2)

showSeperatorWorks = testCase "Separator should be ;" $
              assertEqual [] (removeSpaces "1 ; 2") $ removeSpaces $ show $ (AstInt 1) `Separator` (AstInt 2)

showLetWorks = testCase "Let should be 'let var = 3 in var'" $
              assertEqual [] (removeSpaces "let var = 3 in 4") $ removeSpaces $ show $ Let "var" (AstInt 3) (AstInt 4)

showIdWorks = testCase "Is should show its value" $
              assertEqual [] (removeSpaces "var") $ removeSpaces $ show $ Id "var"

