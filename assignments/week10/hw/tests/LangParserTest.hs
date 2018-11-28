module LangParserTest where

  import Test.Tasty (testGroup)
  import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
  import Test.Tasty.QuickCheck
  
  
  import ParserMonad
  
  import Lang
  import LangParser
  
  
  
  
  --TODO: move the generator to a shared place
  
  instance Arbitrary Ast where
      arbitrary = sized arbitrarySizedAst
  
  arbitrarySizedAst ::  Int -> Gen Ast
  arbitrarySizedAst m | m < 1 = do i <- arbitrary
                                   b <- arbitrary
                                   node <- elements [ValInt i, ValBool b, Nil]
                                   return $ node
  arbitrarySizedAst m | otherwise = do l <- arbitrarySizedAst (m `div` 2)
                                       r <- arbitrarySizedAst (m `div` 2)
                                       str <- elements ["x","y","z"]
                                       ifast <- arbitrarySizedIf m
                                       node <- elements [And l r, Or l r, Not l,
                                                         Plus l r, Minus l r, Mult l r, Div l r,
                                                         Cons l r,
                                                         ifast,
                                                         Let str l r,
                                                         Lam str l,
                                                         App l r,
                                                         Var str
                                                        ]
                                       return node
  
  -- it would be better if every branch were built like this so the balance would be maintained
  arbitrarySizedIf ::  Int -> Gen Ast
  arbitrarySizedIf m = do b <- arbitrarySizedAst (m `div` 3)
                          t <- arbitrarySizedAst (m `div` 3)
                          e <- arbitrarySizedAst (m `div` 3)
                          return $ If b t e
  
  unitTests =
    testGroup
      "LangParserTest"
      [instructorTests
      ,somemoreTests
      ,myTests
       -- TODO: your tests here!!!
     ]
  
  instructorTests = testGroup
        "instructorTests"
        [
        testProperty "parse should return the same AST when fully parenthisized" $ ((\ x -> Just (x , "") == (parse parser $ fullyParenthesized x)) :: Ast -> Bool),
        testProperty "parse should return the same AST when pretty printed" $ ((\ x -> Just (x , "") == (parse parser $ prettyShow x 0)) :: Ast -> Bool)
        ]
  
  somemoreTests = testGroup
        "somemoreTests"
        [
          testCase "bool precedence test" $ assertEqual [] (Just((And (Not (ValBool False)) (ValBool True)), "")) $ (parse parser "! false && true"),
          testCase "parens and bool precedence test" $ assertEqual [] (Just((Not (And (ValBool False) (ValBool True))), "")) $ (parse parser "! (false && true)"),
          testCase "cons right associativity test" $ assertEqual [] (Just (Cons (ValInt 1) (Cons (ValInt 4) (Cons (Plus (ValInt 3) (ValInt 5)) Nil)),"")) $ (parse parser "1 : 4 : 3 + 5 : []"),
          testCase "cons different types test" $ assertEqual [] (Just (Cons (ValInt 1) (Cons (ValInt 4) (Cons (ValBool True) Nil)),"")) $ (parse parser "1 : 4 : true : []")
        ]
  
  string1 = "let x = 10 in if (\\x -> \\y -> x && y) true false then 0 else let y = 4 in x + y"
  ast1 = Let "x" (ValInt 10) (If (App (App (Lam "x" (Lam "y" (And (Var "x") (Var "y")))) (ValBool True)) (ValBool False)) (ValInt 0) (Let "y" (ValInt 4) (Plus (Var "x") (Var "y"))))
  string2 = "!false && 3 + 5*4"
  ast2 = And (Not (ValBool False)) (Plus (ValInt 3) (Mult (ValInt 5) (ValInt 4)))
  string3 = "let z = \\y -> \\x -> y && !   x in  if let   x =  false in x then 10 : 15:[] else z true false"
  ast3 = Let "z" (Lam "y" (Lam "x" (And (Var "y") (Not (Var "x"))))) (If (Let "x" (ValBool False) (Var "x")) (Cons (ValInt 10) (Cons (ValInt 15) Nil)) (App (App (Var "z") (ValBool True)) (ValBool False)))
  string4 = "10 : true&&false : 1 * 3 : []"
  ast4 = Cons (ValInt 10) (Cons (And (ValBool True) (ValBool False)) (Cons (Mult (ValInt 1) (ValInt 3)) Nil))
  string5 = "( ((  []) )  )"
  ast5 = Nil
  
  
  checkStrings = map (\(str, ast) -> testProperty str $ Just (ast, "") == parse parser str)
  
  myTests = testGroup
        "myTests"
        (checkStrings [(string1, ast1), (string2, ast2), (string3, ast3), (string4, ast4), (string5, ast5)])
  
  
  -- TODO: your tests here!!!
  -- TODO: Many, many more example test cases (every simple thing, many normal things, some extreme things)
  