module Lang3Test where

import Data.Map(Map, lookup, insert, empty, fromList)  -- for State

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import Lang3(Ast(AstInt,Plus,Separator,Assign,Id), eval)
import Lang3Parser(unsafeParser, parser)


-- note: probly could be better
instance Arbitrary Ast where
    arbitrary = sized arbitrarySizedAst

arbitrarySizedAst ::  Int -> Gen Ast
arbitrarySizedAst m | m < 1     = do i <- arbitrary
                                     return $ AstInt i
arbitrarySizedAst m | otherwise = do l <- arbitrarySizedAst (m `div` 2)
                                     r <- arbitrarySizedAst (m `div` 2)
                                     str <- elements ["x","y","z"]
                                     node <- elements [Plus l r, Separator l r, Id str, Assign str l ]
                                     return node


unitTests =
  testGroup
    "Lang3Test"
    [instructorTests,
     -- TODO: your tests here
     parseShowTests]

instructorTests = testGroup
      "instructorTests"
      [
      testCase "example eval" $ assertEqual []  (fromList [("x",3)], Just 3) $ eval empty ("x" `Assign` (AstInt 3)) ,
      testCase "example eval on different states" $ assertBool []   $ snd (eval empty   ("x" `Assign` ((AstInt 3) `Plus` (Id  "x"))))
                                                         /=
                                                         snd (eval (fromList [("x",3)]) ("x" `Assign` ((AstInt 3) `Plus` (Id  "x")))) ,

      testCase "example eval" $ assertEqual [] (Just 14) $ (snd (eval empty ((("x" `Assign` (AstInt 3)) `Plus` (Id  "x")) `Plus` ( ("x" `Assign` (AstInt 4)) `Plus` (Id  "x"))    ) )) ,

      testCase "parse test:  x = 3 " $ assertEqual [] (fromList [("x",3)],Just 3) $ eval empty  (unsafeParser " x = 3 ") ,
      testCase "parse test  on different states" $ assertBool []  $ snd (eval empty  (unsafeParser " x = 3 + x "))
                                                      /=
                                                      snd (eval (fromList [("x",3)]) (unsafeParser " x = 3 + x ")),
      testCase "parse test  (x = 3) + x + ((x = 4) + x) " $ assertEqual [] (Just 14) $ snd (eval empty  (unsafeParser " (x = 3) + x + ((x = 4) + x) ") ), --,
-- test case removed because it assumed a less than ideal answer (see https://piazza.com/class/jlpaiu7tfht5ro?cid=486), either should get full credit
--       testCase "parse test  x = (3+5) ; y = x+x; x+y+7 " $ assertEqual [] (Just (Assign "x" (Separator (Plus (AstInt 3) (AstInt 5)) (Assign "y" (Separator (Plus (Id "x") (Id "x")) (Plus (Id "x") (Plus (Id "y") (AstInt 7)))))), "")) $ parser " x = (3+5) ; y = x+x; x+y+7"

      testProperty "show should match parse" $ ((\ x -> Just (x , "") == (parser $ show x)) :: Ast -> Bool)]

-- TODO: add a generator, every show should be parsable, test the Eq laws, tests from lang0 and 1 and week 5, many many more examples
-- TODO: you should always be able to parse show (when the var names aren't too bad)

parseShowTests = testGroup
      "parseShowTests"
      [
      testCase "test parsing show AstInt" $ assertEqual [] (Just ((AstInt 2), "")) $ (parser (show (AstInt 2))),

      testCase "test parsing show Plus" $ assertEqual [] (Just ((Plus (AstInt 2) (AstInt 3)),"")) $ (parser (show (Plus (AstInt 2) (AstInt 3)))),
      
      testCase "test parsing show Separator" $ assertEqual [] (Just ((Separator (AstInt 2) (AstInt 3)),"")) $ (parser (show (Separator (AstInt 2) (AstInt 3)))),

      testCase "test parsing show Id" $ assertEqual [] (Just ((Id "x"), "")) $ (parser (show (Id "x"))),

      testCase "test parsing show Assign" $ assertEqual [] (Just ((Assign "x" (Plus (AstInt 3) (AstInt 2))),"")) $ (parser (show (Assign "x" (Plus (AstInt 3) (AstInt 2))))),
   
      testCase "test eval parsing show Assign" $ assertEqual [] (Just 5) $ snd (eval empty (unsafeParser (show (Assign "x" (Plus (AstInt 3) (AstInt 2))))))
      ]