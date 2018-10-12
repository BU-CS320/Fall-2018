module BinarySearchTreesTest where 

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import BinarySearchTrees

unitTests =
  testGroup
    "DataProblems"
    [memberTest1, memberTest2, treeMinTest1, treeMinTest2, eqTest1, deleteTest1, deleteMinTest1, deleteMinTest2]

-- tree1

--   	 5
--      / \
--     4   7
--    /   /
--   1   6 


tree1 = (Node (Node (Node Null 1 Null) 4 Null) 5 (Node (Node Null 6 Null) 7 Null))
delete5FromTree1 = Node (Node Null 1 (Node Null 4 Null)) 6 (Node Null 7 Null)

-- tree2

--               5
--              /
--             2
--              \
--               4


tree2 = Node (Node Null 2 (Node Null 4 Null)) 5 Null
deleteMinTree2 = Node (Node Null 4 Null) 5 Null

-- tree3
--                10
--                /
--               5
--              /
--             2
--              \
--               4


tree3 = Node (Node (Node Null 2 (Node Null 4 Null)) 5 Null) 10 Null
deleteMinTree3 = Node (Node (Node Null 4 Null) 5 Null) 10 Null


memberTest1 =
 testCase "5 is a part of the tree" $ assertEqual [] True (member 5 tree1)
memberTest2 =
 testCase "2 is NOT a part of the tree" $ assertEqual [] False (member 2 tree1)
treeMinTest1 = 
 testCase "min of this tree is 1" $ assertEqual [] (Just 1) (treeMin tree1)
eqTest1 = 
 testCase "the trees are NOT equal" $ assertEqual [] False (eq tree1 delete5FromTree1)
deleteTest1 = 
 testCase "delete 5 from tree1" $ assertEqual [] True (eq  delete5FromTree1 (delete 5 tree1))
deleteMinTest1 =   -- test where min Node has right subtree 
 testCase "delete 2 from tree2" $ assertEqual [] True (eq deleteMinTree2 (deleteMin tree2))
deleteMinTest2 =   -- test where min Node has right subtree 
 testCase "delete 2 from tree2" $ assertEqual [] True (eq deleteMinTree3 (deleteMin tree3))
treeMinTest2 =  -- test where min Node has right subtree
 testCase "min of tree is 2" $ assertEqual [] (Just 2) (treeMin tree2)


