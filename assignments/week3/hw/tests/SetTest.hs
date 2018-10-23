module SetTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Set(Set, empty, insert, contains, isSubSet, union, intersection)

unitTests =
  testGroup
    "Set"
    [
     ex1Insert,
     ex2Insert,
     ex3Insert,
     ex1Contains,
     ex2Contains,
     ex3Contains,
     ex1IsSubset,
     ex2IsSubset,
     ex3IsSubset,
     ex1Union,
     ex2Union,
     ex3Union,
     ex1intersection,
     ex2intersection
     ]


exampleSet1 = [3, 4, 8, 10, 17]
exampleSet2 = [3, 4, 17]
exampleSet3 = [6, 8, 9, 10]
exampleSet4 = [6, 8, 9]
union13 = [3, 4, 6, 8, 9, 10, 17]
intersection13 = [8, 10]

ex1Insert =
    testCase "insert 10 in exampleSet4" $ assertEqual [] exampleSet3 (insert 10 exampleSet4)

ex2Insert =
    testCase "insert 8 10 in null" $ assertEqual [] intersection13 (insert 10 (insert 8 empty))

ex3Insert =
    testCase "insert .. in null" $ assertEqual [] union13 (insert 9 (insert 10 (insert 6 (insert 8 (insert 10 (insert 3 (insert 17 (insert 4 empty))))))))

ex1Contains =
  testCase "empty set doesn't contain 9" $ assertBool [] (not (contains empty 9))

ex2Contains =
    testCase "exampleSet1 contains 10" $ assertBool [] (contains exampleSet1 10)

ex3Contains =
    testCase "exampleSet1 doesn't contain 7" $ assertBool [] (not (contains exampleSet1 7))

ex1IsSubset =
    testCase "exampleSet2 is a subset of exampleSet1" $ assertBool [] (isSubSet exampleSet2 exampleSet1)

ex2IsSubset =
    testCase "exampleSet3 is not a subset of exampleSet1" $ assertBool [] (not (isSubSet exampleSet3 exampleSet1))

ex3IsSubset =
    testCase "empty is a subset of exampleSet1" $ assertBool [] (isSubSet [] exampleSet1)

ex1Union =
    testCase "union of exampleSet1 & 3" $ assertEqual [] union13 (union exampleSet1 exampleSet3)

ex2Union =
    testCase "union of empty and exampleSet1" $ assertEqual [] exampleSet1 (union exampleSet1 [])

ex3Union =
    testCase "union of exampleSet2 and exampleSet1" $ assertEqual [] exampleSet1 (union exampleSet1 exampleSet2)

ex1intersection =
    testCase "intersection of exampleSet1 & 3" $ assertEqual [] intersection13 (intersection exampleSet1 exampleSet3)

ex2intersection =
    testCase "empty is the intersection of exampleSet2 & intersection13" $ assertEqual [] empty (intersection exampleSet2 intersection13)
