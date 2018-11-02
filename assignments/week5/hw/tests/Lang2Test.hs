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
    [showPlusWorks,
	 showSeperatorWorks,
	 showPrintWorks] 

removeSpaces :: String -> String
removeSpaces [] = []
removeSpaces (h:t) | isSpace h  = removeSpaces t
                   | otherwise  = h : removeSpaces t
	
showPlusWorks = testCase "show should show the pre evaluated expression" $
              assertEqual [] (removeSpaces "1 + 2") $ removeSpaces $ show $ (AstInt 1) `Plus` (AstInt 2)

showSeperatorWorks = testCase "Separator should be ;" $
              assertEqual [] (removeSpaces "1 ; 2") $ removeSpaces $ show $ (AstInt 1) `Separator` (AstInt 2)

showPrintWorks = testCase "print should have 'print' in it" $
              assertBool [] $ isInfixOf "print" $ removeSpaces $ map toLower $ show $ Print (AstInt 2)

