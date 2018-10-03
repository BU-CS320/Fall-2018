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
    [showPlusWorks,
	 showSeperatorWorks,
	 showAssignWorks,
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

showAssignWorks = testCase "Assign should be =" $
              assertEqual [] (removeSpaces "var = 2") $ removeSpaces $ show $ "var" `Assign` (AstInt 2)

showIdWorks = testCase "Is should show its value" $
              assertEqual [] (removeSpaces "var") $ removeSpaces $ show $ Id "var"

