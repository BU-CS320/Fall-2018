module BinarySearchTreesTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import BinarySearchTrees

unitTests =
  testGroup
    "DataProblems"
    [testSize,
     testMember,
     testNotMember,
     testInsert,
     testToList,
     testEquals,
     testMin,
     testDeleteMin,
     testDelete]

-- tree used for tests
--              10
--           6      15
--         4  7   11
--        2

testTree = Node (Node (Node (Node Null 2 Null) 4 Null) 6 (Node Null 7 Null)) 10 (Node (Node Null 11 Null) 15 Null)

-- test size

testSize = testCase "size of test tree" $ assertEqual [] 7 (size testTree)

-- test member

testMember = testCase "11 in tree" $ assertBool [] (member 11 testTree)
testNotMember = testCase "1 not in tree" $ assertBool [] (not (member 1 testTree))

-- test insert

testInsert = testCase "insert 13 in correct place" $ assertBool [] (eq (insert 13 testTree) 
        (Node (Node (Node (Node Null 2 Null) 4 Null) 6 (Node Null 7 Null)) 10 (Node (Node Null 11 (Node Null 13 Null)) 15 Null))
    )

-- test toList

testToList = testCase "turn test tree to list" $ assertEqual [] [2, 4, 6, 7, 10, 11, 15] (toList testTree)

-- test eq

testTree2 = Node (Node (Node (Node Null 2 Null) 4 Null) 6 (Node Null 7 Null)) 10 (Node (Node Null 11 Null) 15 Null)
testEquals = testCase "testing equality" $ assertBool [] (eq testTree testTree2)

-- test treeMin

testMin = testCase "testing min" $ assertEqual [] (Just 2) (treeMin testTree)

-- test deleteMin

testTreeDeletedMin = Node (Node (Node Null 4 Null) 6 (Node Null 7 Null)) 10 (Node (Node Null 11 Null) 15 Null)
testDeleteMin = testCase "delete min out of test tree" $ assertBool [] (eq (deleteMin testTree) testTreeDeletedMin)

-- test delete

testTreeDeletedRoot = Node (Node (Node (Node Null 2 Null) 4 Null) 6 (Node Null 7 Null)) 11 (Node Null 15 Null)
testDelete = testCase "delete 10 (root) out of test tree" $ assertBool [] (eq (delete 10 testTree) testTreeDeletedRoot)

