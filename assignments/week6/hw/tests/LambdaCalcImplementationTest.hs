module LambdaCalcImplementationTest  where

import Data.Map
import Data.Set
import Data.Char

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty,Arbitrary, oneof,arbitrary)



import LambdaCalcImplementation(LambdaExpression(App, Lam, Identifier ) ,isValue, freeVars, eval)


unitTests =
  testGroup
    "LambdaCalcImplementationTest"
    [instructorTests
-- TODO: add your own tests here!
    ]

instance Arbitrary LambdaExpression where
    arbitrary = oneof
        [ arbitrary >>= \ s -> return $ Identifier s,
          arbitrary >>= \ f -> arbitrary >>= \ a -> return $ App f a,
          arbitrary >>= \ s -> arbitrary >>= \ bod -> return $ Lam s bod
        ]

removeSpaces :: String -> String
removeSpaces [] = []
removeSpaces (h:t) | isSpace h  = removeSpaces t
                   | otherwise  = h : removeSpaces t


cleanParens :: String -> String
cleanParens [] = []
cleanParens (h:t) | h == '(' = "(" ++ cleanParens t
                  | h == ')' = ")" ++ cleanParens t
                  | h == '[' = "(" ++ cleanParens t
                  | h == ']' = ")" ++ cleanParens t
                  | h == '{' = "(" ++ cleanParens t
                  | h == '}' = ")" ++ cleanParens t -- TODO: if you want to do something different post add it here (make sure you pull request)
                  | otherwise  = h : cleanParens t

cleanLam :: String -> String
cleanLam [] = []
cleanLam (h:t) | h == 'λ' = "λ" ++ cleanLam t
                  | h == '\\' = "λ" ++ cleanLam t -- TODO: if you want to do something different post add it here (make sure you pull request)
                  | otherwise  = h : cleanLam t


anyOk :: String -> String
anyOk s = cleanLam $ cleanParens $ removeSpaces s

instructorTests = testGroup
      "instructorTests"
      [
  testCase "bound names don't matter for equality " $ assertEqual [] (Lam "x" $ Identifier "x") $ (Lam "hi" $ Identifier "hi"),
  testCase "avoid var capture " $ assertEqual [] (Lam "a" $ Lam "b" $ Identifier "a") $ eval Data.Map.empty (Lam "x" $ App (Lam "y" $ Lam "x" $ Identifier "y") $ Identifier "x"),


  testProperty "no values do not evaluate" $ (((\lam -> if isValue lam
                                                 then  lam == eval Data.Map.empty lam
                                                 else True)):: ( LambdaExpression -> Bool)),

  testProperty "always equal self" $ (((\lam -> lam == lam)):: ( LambdaExpression -> Bool)),

  testCase "varaibles show correctly" $ assertEqual [] (anyOk "hi") $  (anyOk $ show $ Identifier "hi"),
  testCase "app show correctly" $ assertEqual [] (anyOk "hi there") $  (anyOk $ show $ App (Identifier "hi") (Identifier "there"))


      ]

-- TODO add your own tests here!
-- TODO There should be many more examples of correct evaluation
