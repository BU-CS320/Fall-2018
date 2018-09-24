module SetTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Set

unitTests =
  testGroup
    "Set"
    [emptySetNot9,
     exContains10,
     ex2SubsetEx1,
     ex3NotSubsetEx1,
     unionEx1Ex3,
     intersectionEx1Ex3]

-- should create [3, 4, 8, 10, 17]
exampleSet1 = insert 8 (insert 10 (insert 3 (insert 17 (insert 4 empty))))
-- should create [3, 4, 17]
exampleSet2 = insert 17 (insert 4 (insert 3 empty))
-- should create [6, 8, 9, 10]
exampleSet3 = insert 6 (insert 9 (insert 8 (insert 10 empty)))
-- should create [3, 4, 6, 8, 9, 10, 17]
union13 = insert 9 (insert 6 (insert 8 (insert 10 (insert 3 (insert 17 (insert 4 empty))))))
-- should create [8, 10]
intersection13 = insert 10 (insert 8 empty)


emptySetNot9 =
  testCase "empty set doesn't contain 9" $ assertBool [] (not (contains empty 9))
 
exContains10 =
    testCase "exampleSet1 contains 10" $ assertBool [] (contains exampleSet1 10)

ex2SubsetEx1 = 
    testCase "exampleSet2 is a subset of exampleSet1" $ assertBool [] (isSubSet exampleSet2 exampleSet1)

ex3NotSubsetEx1 = 
    testCase "exampleSet3 is not a subset of exampleSet1" $ assertBool [] (not (isSubSet exampleSet3 exampleSet1))

unionEx1Ex3 = 
    testCase "union of exampleSet1 & 3" $ assertEqual [] union13 (union exampleSet1 exampleSet3)

intersectionEx1Ex3 =
    testCase "intersection of exampleSet1 & 3" $ assertEqual [] intersection13 (intersection exampleSet1 exampleSet3)



  
 