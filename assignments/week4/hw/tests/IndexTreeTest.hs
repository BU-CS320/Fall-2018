module IndexTreeTest where 

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import IndexTree

import Data.List (sort)
areEqual a b = sort a == sort b

unitTests =
  testGroup
    "IndexTreeTest"
    [test_lookupKey,
     test_member,
     test_keys,
     test_pairs,
     test_invert,
     test_equal]


-- create IndexTree: Node (Node (Node (Node (Node (Node Null 1 ["homework"] Null) 2 ["damn"] Null) 3 ["is"] Null) 4 ["this"] Null) 5 ["hard"] Null) 6 ["so"] Null

exampleTree1 = insert 4 "this" (insert 1 "homework" (insert 3 "is" (insert 6 "so" (insert 2 "damn" (insert 5 "hard" Null)))))


test_lookupKey =
  testCase "look for key 5 in exampleTree1" $ assertEqual [] (["hard"]) (lookupKey 5 exampleTree1)

test_member =
  testCase "1 homework is in exampleTree1" $ assertBool [] (member 1 "homework" exampleTree1)

test_keys =
  testCase "keys for exampleTree1" $ assertEqual [] ([1,2,3,4,5,6]) (keys exampleTree1)

test_pairs =
  testCase "pairs for exampleTree1" $ assertBool [] (areEqual ([(1,"homework"),(2,"damn"),(3,"is"),(4,"this"),(5,"hard"),(6,"so")]) (pairs exampleTree1))

test_invert =
  testCase "invert exampleTree1" $ assertEqual [] (insert "this" 4 (insert "homework" 1 (insert "is" 3 (insert "so" 6 (insert "damn" 2 (insert "hard" 5 Null)))))) (invert exampleTree1)

test_equal =
  testCase "exampleTree1 == exampleTree1" $ assertBool [] (exampleTree1 == exampleTree1)