module IcInterpreterTest where


import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck


--This is to test the instructor's code

import IcInterperterExamples
import ICInterpreter
import StatefulUnsafeMonad





interperterOk p ls = case execute p of
            (Ok _, new) -> testCase ( show new) $ assertEqual [] ls  new
            (Error e, _) -> testCase ( "Error "++ e) $ assertBool [] $ False

unitTests =
  testGroup
    "IcInterpreterTest"
     [
        interperterOk icTest7 ["z = 12"]
     ]

