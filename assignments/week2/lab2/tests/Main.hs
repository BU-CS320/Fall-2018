module Main where
import Data

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

main = defaultMain unitTests

unitTests =
  testGroup
    "Tests"
    [andTrueTrue, add3and5]

-- this function converts from our custom Bools to the standard Bools so we have a lot of automatic things already defined
fromLabBoolToStandardBool :: Data.Bool -> Prelude.Bool
fromLabBoolToStandardBool Data.True  = Prelude.True
fromLabBoolToStandardBool Data.False = Prelude.False

-- this function converts from our custom Nats to the standard Integers so we have a lot of automatic things already defined
fromNatToInteger :: Nat -> Integer
fromNatToInteger Zero     = 0
fromNatToInteger (Succ n) = 1 + (fromNatToInteger n)

-- and True True = True
andTrueTrue =
  testCase "and True True = True" $ assertBool [] (fromLabBoolToStandardBool (Data.and Data.True Data.True))

-- the defined numbers should add the correct way
add3and5 =
  testCase "3 + 5 = 8" $ assertEqual [] 8 (fromNatToInteger (Data.add Data.three Data.five))