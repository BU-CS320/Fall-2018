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
    [instructorTests
     -- TODO: your tests here!!!
	 ]


shouldEvalToNum :: String -> Rational -> String -> TestTree
shouldEvalToNum s num parseThis = testCase (s ++  ": " ++ parseThis) $ assertEqual []  (Just (Ok num)) $ fmap (eval . fst) (parse parser parseThis)

instructorTests = testGroup
      "instructorTests"
      [ shouldEvalToNum "" 0 "0",
        shouldEvalToNum "" 15 "1 + 2 + 3 + 4 + 5",
        shouldEvalToNum "" 15 "1 + (2 + 3) + ((4) + 5)",
        shouldEvalToNum "" 36 "2 * 4 * 3",
        shouldEvalToNum "" 6 "12 / 2 ",
        shouldEvalToNum "" 12212 "22222 - 10 - 1000"
      ]

-- TODO: your tests here!!!
-- TODO: test structural equality on your AST "2 + 2 /= 4" but "2*3 + 4*5" == "(2*3) + (4*5)"
-- TODO: every simple thing parses and evals
-- TODO: division by 0 gives an error, errors propagate correctly
-- TODO: many many examples
-- TODO: some really long example
-- TODO: for any valid Arith AST show should be parsable to the same AST
-- TODO: clean up shouldEvalToNum string (handle empty s better, show the AST?)