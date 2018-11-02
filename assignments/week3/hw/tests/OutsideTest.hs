module OutsideTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Outside(exampleSet, eqSet, exampleBst, onlyHasEven)

import Outside(exampleSet, eqSet, exampleBst, onlyHasEven)
import Set(Set(..), empty, insert)
import BinarySearchTrees(Tree(..), insert, eq)

unitTests =
  testGroup
    "Outside"
    [
     ex1ExampleSet,
     ex1ExampleSet,
     ex1EqSet,
     ex2EqSet,
     ex3EqSet,
     ex4EqSet,
     ex1ExampleBST,
     ex1onlyHasEven,
     ex2onlyHasEven,
     ex3onlyHasEven
    ]

insertAllBst :: [Integer] -> Tree
insertAllBst [] = Null
insertAllBst (h:t) = BinarySearchTrees.insert h $ insertAllBst t

insertAllSet :: [Integer] -> Set
insertAllSet [] = empty
insertAllSet (h:t) = Set.insert h $ insertAllSet t

exampleSet1 = insertAllSet [2, 4, 8, 16, 32, 64]
exampleSet2 = insertAllSet [2, 4, 8, 16, 32]
exampleBst1 = insertAllBst [2, 4, 8, 16, 32, 64]
exampleBst2 = insertAllBst [2, 4, 8, 16, 32, 63]

ex1ExampleSet =
    testCase "example set is equal" $ assertBool [] $ eqSet exampleSet1 exampleSet1

ex1EqSet =
    testCase "EQUAL: exampleSet1 is equal to exampleSet1 is correct" $ assertBool [] $ eqSet exampleSet1 exampleSet1

ex2EqSet =
    testCase "EQUAL: empty is equal to empty" $ assertBool [] $ eqSet empty empty

ex3EqSet =
    testCase "EQUAL: empty is not equal to exampleSet1" $ assertBool [] $ not (eqSet empty exampleSet1)

ex4EqSet =
    testCase "EQUAL: exampleSet1 is not equal to exampleSet2" $ assertBool [] $ not (eqSet exampleSet2 exampleSet1)

ex1ExampleBST =
    testCase "exampleBST is equal to the generated insert" $ assertBool [] $ eq exampleBst1 exampleBst

ex1onlyHasEven =
    testCase "exampleBst1 has only even numbers" $ assertBool [] $ onlyHasEven exampleBst1

ex2onlyHasEven =
    testCase "exampleBst2 one odd number" $ assertBool [] $ not (onlyHasEven exampleBst2)

ex3onlyHasEven =
    testCase "Null is not even" $ assertBool [] $ not (onlyHasEven Null)


	
	