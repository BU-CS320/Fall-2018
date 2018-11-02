module TypeclassProblemsTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import TypeclassProblems(NotReflexive, example, NotSymmetric, examplex', exampley', NotTransitive, examplex'',exampley'',examplez'', ListNoIdentity,exampleBadId, ListNoComposition,ls,f,g)


unitTests =
  testGroup
    "TypeclassProblemsTest"
    []
