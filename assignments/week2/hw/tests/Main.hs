module Main where
import Hw

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

main = defaultMain unitTests

unitTests =
  testGroup
    "Tests"
    [andTrueTrue, mult3and5, lectureDayApril]

-- this function converts from our custom Bools to the standard Bools so we have a lot of automatic things already defined
fromhwBoolToStandardBool :: Hw.Bool -> Prelude.Bool
fromhwBoolToStandardBool Hw.True  = Prelude.True
fromhwBoolToStandardBool Hw.False = Prelude.False

-- this function converts from our custom Nats to the standard Integers so we have a lot of automatic things already defined
fromNatToInteger :: Nat -> Integer
fromNatToInteger Zero     = 0
fromNatToInteger (Succ n) = 1 + (fromNatToInteger n)

-- and True True = True
andTrueTrue =
  testCase "or True True = True" $ assertBool [] (fromhwBoolToStandardBool (Hw.or Hw.True Hw.True))

-- the defined numbers should add the correct way
mult3and5 =
  testCase "3 * 5 = 15" $ assertEqual [] 15 (fromNatToInteger (Hw.mult Hw.three Hw.five))

-- A lecture day in the months outside of the Fall 2018 Semester should not count
lectureDayApril = 
  testCase "lectureDay (Date April 3 Tuesday) = False" $ assertEqual [] Prelude.False (fromhwBoolToStandardBool (Hw.lectureDay (Hw.Date Hw.April Hw.three Hw.Tuesday)))