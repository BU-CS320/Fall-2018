module IndexTreeTest where 

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import IndexTree


unitTests =
  testGroup
    "IndexTreeTest"
    [test_lookupKey,
     test_member,
     test_keys,
     test_pairs,
     test_invert,
     test_equal]


-- create IndexTree: Node (Node (Node (Node (Node (Node Null 1 ["this"] Null) 2 ["homework"] Null) 3 ["is"] Null) 4 ["so"] Null) 5 ["damn"] Null) 6 ["hard"] Null

exampleTree1 = insert 1 "this" (insert 2 "homework" (insert 3 "is" (insert 4 "so" (insert 5 "damn" (insert 6 "hard" Null)))))


test_lookupKey =
  testCase "look for key 5 in exampleTree1" $ assertEqual [] (["damn"]) (lookupKey 5 exampleTree1)

test_member =
  testCase "2 homework is in exampleTree1" $ assertBool [] (member 2 "homework" exampleTree1)

test_keys =
  testCase "keys for exampleTree1" $ assertEqual [] ([1,2,3,4,5,6]) (keys exampleTree1)

test_pairs =
  testCase "pairs for exampleTree1" $ assertEqual [] ([(1,"this"),(2,"homework"),(3,"is"),(4,"so"),(5,"damn"),(6,"hard")]) (pairs exampleTree1)

test_invert =
  testCase "invert exampleTree1" $ assertEqual [] (insert "this" 1 (insert "homework" 2 (insert "is" 3 (insert "so" 4 (insert "damn" 5 (insert "hard" 6 Null)))))) (invert exampleTree1)

test_equal =
  testCase "exampleTree1 == exampleTree1" $ assertBool [] (exampleTree1 == exampleTree1)