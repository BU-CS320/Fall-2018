module Lang0Test where

import Data.Char

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary )

import Lang0(Ast(AstInt,Plus), eval)

-- if some hero wants to write these for all data, I'm sure the class will appreciate it! (it will be a real challenge for the next 2 weeks)
instance Arbitrary Ast where
    arbitrary = oneof
        [ arbitrary >>= \ i -> return $ AstInt i,
		  arbitrary >>= \ l -> arbitrary >>= \ r -> return $ Plus l r
        ]


unitTests =
  testGroup
    "Lang0Test"
    [showWorks,
	 eqWorks,
	 showNeverEmpty,
	 eqReflLaw] 

removeSpaces :: String -> String
removeSpaces [] = []
removeSpaces (h:t) | isSpace h  = removeSpaces t
                   | otherwise  = h : removeSpaces t
	
showWorks = testCase "show should show the pre evaluated expression" $
              assertEqual [] (removeSpaces "1 + 2") $ removeSpaces $ show $ (AstInt 1) `Plus` (AstInt 2)

eqWorks = testCase "things that eval the same should be equal" $
              assertEqual [] (AstInt 3) $ (AstInt 1) `Plus` (AstInt 2)


showNeverEmpty = testProperty "show is never empty" $ ((\ x -> 0 < (length $ show x)) :: Ast -> Bool)
			  
-- test the eq laws
eqReflLaw = testProperty "for all x. x == x" $ ((\ x -> x == x) :: Ast -> Bool)


-- test that GTE works with Eq
