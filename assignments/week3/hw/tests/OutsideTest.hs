module OutsideTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Outside(exampleSet, eqSet, exampleBst, onlyHasEven)
import Set
import BinarySearchTrees

unitTests =
  testGroup
    "Outside"
    [testIsEq,
     testIsNotEq,
     testOnlyHasEven,
     testNotOnlyHasEven]

-- test eq set

set1 :: Set
set1 = [1, 2, 3, 4]

set2 :: Set
set2 = [1, 2, 3, 4]

set3 :: Set
set3 = [5, 6, 7]

testIsEq = testCase "set1 and set2 are equal" $ assertBool [] (eqSet set1 set2)
testIsNotEq = testCase "set1 and set3 are not equal" $ assertBool [] (not (eqSet set1 set3))


-- test onlyHasEven

tree1 = Node (Node (Node Null 2 Null) 4 (Node Null 8 Null)) 16 (Node Null 32 (Node Null 64 Null))
tree2 = Node (Node (Node Null 1 Null) 4 (Node Null 8 Null)) 16 (Node Null 32 (Node Null 65 Null))

testOnlyHasEven = testCase "tree1 returns true for onlyHasEven" $ assertBool [] (onlyHasEven tree1)
testNotOnlyHasEven = testCase "tree2 returns false for onlyHasEven" $ assertBool [] (not (onlyHasEven tree2))

