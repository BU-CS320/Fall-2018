module SetTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Set

unitTests =
  testGroup
    "Set"
    [testContains,
     testNotContains,
     testInsert,
     testIsPrefix,
     testIsNotPrefix,
     testIsSubset,
     testIsNotSubset,
     testUnion,
     testIntersection]

-- test sets
set1 :: Set
set1 = [1, 3, 5, 7, 9]

set2 :: Set
set2 = [1, 2, 3, 4, 5, 6]

-- test contains

testContains = testCase "set1 contains 5" $ assertBool [] (contains set1 5)
testNotContains = testCase "set1 does not contain 6" $ assertBool [] (contains set2 6)

-- test insert

testInsert = testCase "insert 6 into set1" $ assertEqual [] [1, 3, 5, 6, 7, 9] (insert 6 set1)

-- test isPrefix

testPrefix :: Set
testPrefix = [1, 3]
testIsPrefix = testCase "[1, 3] is a prefix of set1" $ assertBool [] (isPrefix testPrefix set1)
testIsNotPrefix = testCase "[1, 3] is not a prefix of set2" $ assertBool [] (not (isPrefix testPrefix set2))

-- test isSubset

testSubset :: Set
testSubset = [3, 7]
testIsSubset = testCase "[3, 7] is a subset of set1" $ assertBool [] (isSubSet testSubset set1)
testIsNotSubset = testCase "[3, 7] is not a subset of set2" $ assertBool [] (not (isSubSet testSubset set2))

-- test union

correctUnion :: Set
correctUnion = [1, 2, 3, 4, 5, 6, 7, 9]
testUnion = testCase "union of set1 and set2" $ assertEqual [] correctUnion (union set1 set2)

-- test intersection

correctIntersection :: Set
correctIntersection = [1, 3, 5]
testIntersection = testCase "intersection of set1 and set2" $ assertEqual [] correctIntersection (intersection set1 set2)

