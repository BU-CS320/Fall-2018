module ArithTest where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck

import ParserMonad
import ExceptionMonad
import Arith(Arith, eval, parser)

unitTests =
  testGroup
    "ArithTest"
    [instructorTests,
     -- TODO: your tests here!!!
     somemoreTests]


shouldEvalToNum :: String -> Rational -> String -> TestTree
shouldEvalToNum s num parseThis = testCase (s ++  ": " ++ parseThis) $ assertEqual []  (Just (Ok num)) $ fmap (eval . fst) (parse parser parseThis)

instructorTests = testGroup
      "instructorTests"
      [ shouldEvalToNum "" 0 "0",
        shouldEvalToNum "" 15 "1 + 2 + 3 + 4 + 5",
        shouldEvalToNum "" 15 "1 + (2 + 3) + ((4) + 5)",
        shouldEvalToNum "" 24 "2 * 4 * 3",
        shouldEvalToNum "" 6 "12 / 2 ",
        shouldEvalToNum "" 21212 "22222 - 10 - 1000",
        shouldEvalToNum "" 16 "128 / 4 / 2"
      ]

-- TODO: your tests here!!!
-- TODO: test structural equality on your AST "2 + 2 /= 4"
-- TODO: every simple thing parses and evals
-- TODO: division by 0 gives an error, errors propagate correctly
-- TODO: many many examples
-- TODO: some really long example
-- TODO: for any valid Arith AST show should be parsable to the same AST
-- TODO: clean up shouldEvalToNum string (handle empty s better, show the AST?)

somemoreTests = testGroup
      "somemoreTests"
      [ shouldEvalToNum "" 9 "(1+2) * (2+1)",
        shouldEvalToNum "" 6 "1 + 2 * 2 + 1",
        shouldEvalToNum "" 15 "2 * 3 + 4 + 5",

        testCase "Arith AST structral inequality" $ assertBool [] ((parse parser "6") /= (parse parser "(2*3)")),
        
        testCase "Arith AST structral equality" $ assertBool [] ((parse parser "2*3 + 4*5") == (parse parser "(2*3) + (4*5)")),

        testCase "Arith AST structral inequality" $ assertBool [] ((parse parser "(1+2) * (2+1)") /= (parse parser "1 + 2 * 2 + 1"))
      ]