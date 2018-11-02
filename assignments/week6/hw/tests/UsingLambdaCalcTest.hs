module UsingLambdaCalcTest  where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty )


import UsingLambdaCalc(true, false, not, and, or, xor, zero, one,two,three,seven, add, mult, isEven )


unitTests =
  testGroup
    "UsingLambdaCalcTest"
    [instructorTests,
-- TODO: add your own tests here!
    somemoreTests]


toStandardBool b = b True False

toStandardInteger n = n (+1) 0

fromStandardInteger :: Integer -> (a -> a) -> a -> a
fromStandardInteger 0 f s = s
fromStandardInteger n f s = f (fromStandardInteger (n-1) f s )

instructorTests = testGroup
      "instructorTests"
      [
  testCase "true returns first" $ assertEqual [] "then" $ true "then" "else",
  testCase "false returns 2nd" $ assertEqual [] "else" $ false "then" "else",

  testCase "(not true) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.not true),
  testCase "(not false) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.not false),

  testCase "(and true true) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.and true true),
  testCase "(and true false) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.and true false),
  testCase "(and false true) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.and false true),
  testCase "(and false false) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.and false false),

  testCase "0 ok" $ assertEqual [] 0 $ toStandardInteger zero,
  testCase "1 ok" $ assertEqual [] 1 $ toStandardInteger one,
  testCase "2 ok" $ assertEqual [] 2 $ toStandardInteger two,
  testCase "3 ok" $ assertEqual [] 3 $ toStandardInteger three,
  testCase "7 ok" $ assertEqual [] 7 $ toStandardInteger seven,

-- warnig this test takes a while
  testProperty "add is correct" $ (((\n m -> if m >= 0 && n >= 0
                                                 then  (n + m == (toStandardInteger $ add (fromStandardInteger n) (fromStandardInteger m)))
                                                 else True)):: (Integer -> Integer -> Bool)),

  testProperty "mult is correct" $ (((\n m -> if m >= 0 && n >= 0
                                                 then  (n * m == (toStandardInteger $ mult (fromStandardInteger n) (fromStandardInteger m)))
                                                 else True)):: (Integer -> Integer -> Bool)) ,

  testCase "isEven 0 ok" $ assertEqual [] True $ toStandardBool $ isEven zero,
  testCase "isEven 1 ok" $ assertEqual [] False $ toStandardBool $ isEven one,
  testCase "isEven 2 ok" $ assertEqual [] True $  toStandardBool $ isEven two,
  testProperty "isEven is correct" $ (((\n -> if n >= 0
                                                 then  ((mod n 2) == 0) == (toStandardBool $ isEven $ fromStandardInteger n)--isEven (fromStandardInteger n)))
                                                 else True)):: ( Integer -> Bool))
      ]

-- TODO add your own tests here!
-- TODO test all cases of or, not !
-- TODO Test individual cases for add, mult, isEven !

somemoreTests = testGroup
      "somemoreTests"
      [
  testCase "(or true true) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.or true true),
  testCase "(or true false) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.or true false),
  testCase "(or false true) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.or false true),
  testCase "(or false false) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.or false false),

  testCase "(xor true true) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.xor true true),
  testCase "(xor true false) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.xor true false),
  testCase "(xor false true) -> true" $ assertEqual [] True $ toStandardBool (UsingLambdaCalc.xor false true),
  testCase "(xor false false) -> false" $ assertEqual [] False $ toStandardBool (UsingLambdaCalc.xor false false)
      ]