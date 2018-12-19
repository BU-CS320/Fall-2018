module AstInterperterTests where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck


import TestsProject
import CParser(parser)
import ParserMonad(parse)
import ASTInterpreter(eval)


parseInterpert :: String ->  String -> [String] -> TestTree
parseInterpert msg s pr = case parse (parser) s of Just (ast,_) -> testCase msg $ assertEqual []  pr $ eval ast
                                                   Nothing -> testCase msg $  assertBool "couldn't parse" False
unitTests =
  testGroup
    "AstInterperterTests"
     [parseInterpert "ASTInterpreter.test1" test1 ["w = 24"]
      , parseInterpert "ASTInterpreter.test2" test2 ["x = 4","z = -1","z = -1","x = 4","y = 2"]
      , parseInterpert "ASTInterpreter.test3" test3 ["sum = 55"]
      , parseInterpert "ASTInterpreter.test4" test4 ["count = 7"]
      , parseInterpert "ASTInterpreter.test5" test5 ["n = 2","n = 3","n = 5","n = 7","n = 11","n = 13","n = 17","n = 19","n = 23","n = 29","n = 31"]
      , parseInterpert "ASTInterpreter.test6" test6 ["x = 3","x = 3","x = 3"]
      , parseInterpert "ASTInterpreter.test7" test7 ["z = 12"]
      , parseInterpert "ASTInterpreter.test8" test8 ["z = 11"]
      , parseInterpert "ASTInterpreter.test9" test9 ["z = 8"]
      , parseInterpert "ASTInterpreter.test10" test10 ["z = 22"]
      , parseInterpert "ASTInterpreter.test11" test11 ["res = 2"]
      , parseInterpert "ASTInterpreter.test12" test12 ["q = 1","q = 1","q = 2","q = 3","q = 3","q = 4","q = 5","q = 5","q = 6","q = 6","q = 6","q = 8","q = 8","q = 8","q = 10","q = 9","q = 10","q = 11","q = 11"]
      , parseInterpert "ASTInterpreter.test13" test13 ["n = 1","k = 3","n = 10"]
      , parseInterpert "ASTInterpreter.test14" test14 ["k = 4","k = 5","k = 6"]
     ]


