module InfiniteListsTest where


import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck (testProperty )

import InfiniteLists(aList,repeatList,interleave, expand, factorials, iter, collatz1, collatz, randomSequence,fibonacci,hamming, primes, pascalRow, choose)


unitTests =
  testGroup
    "InfiniteListsTest"
    [testA,testB, testC,testD1,testD2,testE,testF,testG,testH, testI,testJ,testK,testL,testL1,testL2
-- TODO: add your own tests here!
    ]
    

testA = testCase "testA: first 10 correct" $ assertEqual []  [0,1,0,-1,0,1,0,-1,0,1] $ (take 10 aList)

testB = testCase "testB: first 10 correct" $ assertEqual []  [0,1,0,-1,0,1,0,-1,0,1] $ take 10 (repeatList [0,1,0,-1])

x1 = [1..]
x2 = [2..]

testC = testCase "testC: first 10 correct" $ assertEqual []  [1,2,2,3,3,4,4,5,5,6] $ take 10 (interleave x1 x2)

testD1 =  testCase "testD: first 6 correct" $ assertEqual [] [1,2,2,3,3,3] $ take 6 (expand [1,2,3])

testD2 =  testCase "testD: first 21 correct" $ assertEqual [] [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6] $ take 21 (expand [1..])

testE =  testCase "testE: first 10 correct" $ assertEqual [] [1,2,6,24,120,720,5040,40320,362880,3628800] $ take 10 factorials

testF =  testCase "testE: first 5 correct" $ assertEqual [] [1,2,3,4,5] $  take 5 (iter (+1) 1)

testG = testCase "testG: collatz 17 " $ assertEqual [] [17,52,26,13,40,20,10,5,16,8,4,2,1] $  collatz 17

testH = testCase "testH: randomSequence 7927 3591 1 10000 " $ assertEqual [] [7927,5858,6079,9690,6791,6482,6863,5034,7095,8146] $  take 10 (randomSequence 7927 3591 1 10000)

testI = testCase "testI: first 20 correct" $ assertEqual [] [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765] $  take 20 fibonacci

testJ = testCase "testJ: first 10 correct" $ assertEqual [] [30,60,90,120,150,180,210,240,270,300] $  (take 10 hamming)

testK = testCase "testJ: first 20 correct" $ assertEqual [] [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71] $  (take 20 primes)

testL = testCase "testL: take 10 (pascalRow 4)" $ assertEqual [] [1,5,15,35,70,126,210,330,495,715] $  take 10 (pascalRow 4)

testL1 = testCase "testL: choose 3 2" $ assertEqual [] 3 $  choose 3 2

testL2 = testCase "testL: choose 10 5" $ assertEqual [] 252 $  choose 10 5


-- TODO: add your own tests here!