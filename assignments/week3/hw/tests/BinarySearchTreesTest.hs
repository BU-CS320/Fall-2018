module BinarySearchTreesTest where 

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import BinarySearchTrees(Tree(..), insert, size, member, toList, eq, treeMin, delete)

unitTests =
  testGroup
    "BinarySearchTrees"
    [
     ex1Size,
     ex2Size,
     ex1Member,
     ex2Member,
     ex3Member,
     ex1Insert,
     ex2Insert,
     ex1ToList,
     ex2ToList,
     ex1Eq,
     ex2Eq,
     ex3Eq,
     ex4Eq,
     ex1TreeMin,
     ex2TreeMin,
     ex1Delete,
     ex2Delete,
     ex3Delete,
     ex4Delete
    ]

--here's a helper function
insertAll :: [Integer] -> Tree
insertAll [] = Null
insertAll (h:t) = insert h $ insertAll t

tree1 = insertAll [2, 1, 4, 8, 6, 7, 3, 5]
tree2 = insertAll [2]
tree3 = insertAll [100, 2, 1, 4, 8, 6, 7, 3, 5]
tree4 = insertAll [2, 4, 8, 6, 7, 3, 5]
tree5 = insertAll [2, 1]
tree6 = insertAll [2, 1, 4, 8, 7, 3, 6]
tree7 = insertAll [1, 7, 8, 6, 10]
tree8 = insertAll [6, 8, 7, 1, 10]
tree9 = insertAll []

ex1Size =
    testCase "size tree1 is 8" $ assertEqual [] 8 (size tree1)

ex2Size =
    testCase "size null is 0" $ assertEqual [] 0 (size Null)

ex1Member =
    testCase "8 is a member of tree1" $ assertBool [] (member 8 tree1)

ex2Member =
    testCase "9 is not a member of tree1" $ assertBool [] (not (member 9 tree1))

ex3Member =
    testCase "10 is not a member of Null (should be obvi)" $ assertBool [] (not (member 10 Null))

ex1Insert =
    testCase "create tree1 + no duplicates" $ assertBool [] $ eq tree1 (insertAll [5, 2, 1, 1, 4, 4, 8, 8, 6, 7, 3, 5])

ex2Insert =
    testCase "insert 100 in tree1" $ assertBool [] $ eq tree3 (insert 100 tree1)

ex1ToList =
    testCase "Null to empty" $ assertEqual [] [] (toList Null)

ex2ToList =
    testCase "tree1 to sorted list" $ assertEqual [] [1,2,3,4,5,6,7,8] (toList tree1)

ex1Eq =
    testCase "EQUAL: tree1 is equal to tree1" $ assertBool [] (eq tree1 tree1)

ex2Eq =
    testCase "EQUAL: tree1 is not equal tree2" $ assertBool [] (not (eq tree1 tree2))

ex3Eq =
    testCase "EQUAL: null is equal to null" $ assertBool [] (eq tree9 tree9)

ex4Eq =
    testCase "EQUAL: null is not equal to tree1" $ assertBool [] (not (eq tree1 tree9))

ex1TreeMin =
    testCase "tree1 has 1 as min" $ assertEqual [] (Just 1) (treeMin tree1)

ex2TreeMin =
    testCase "Null has Nothing" $ assertEqual [] Nothing (treeMin Null)

ex1Delete =
    testCase "delete {3,4,5,6,7,8} from tree1" $ assertBool [] $ eq tree5 (delete 3 (delete 4 (delete 5 (delete 6 (delete 7 (delete 8 tree1))))))

ex2Delete =
    testCase "delete 5 from tree1" $ assertBool [] $ eq tree6 (delete 5 tree1)

ex3Delete =
    testCase "delete 9 from tree8" $ assertBool [] $ eq tree8 (delete 9 tree8)

ex4Delete =
    testCase "delete 1 from tree1" $ assertBool [] $ eq tree4 (delete 1 tree1)
