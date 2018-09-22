module SetTest where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import Set

unitTests =
  testGroup
    "Set"
    [emptySetNot9,
    containsRear,
    containsFront,
    containsMid,
    containsOne,
    containsFalse,
    insertEmpty,
    insertRear,
    insertFront,
    insertMid,
    insertDuplicate,
    isSubsetEE,
    isSubsetNE,
    isSubsetEN,
    isSubsetFront,
    isSubsetRear,
    isSubsetMid,
    isSubsetDisconnect,
    isSubsetPartial,
    unionSame,
    unionOrder,
    unionSwitch,
    unionInter,
    unionEN,
    unionNE,
    intersectionEE,
    intersectionNE,
    intersectionEN,
    intersectionFront,
    intersectionRear,
    intersectionMid,
    intersectionSame,
    intersectionFalse,
    intersectionDisconnect]


--------------------------------------------------------------------------
------------------------------ CONTAINS TESTS ----------------------------

emptySetNot9 =
  testCase "empty set doesn't contain 9" $ assertBool [] (not (contains empty 9))

containsRear =
  testCase "[1,2,3,4,5] contains 5" $ assertBool [] (contains [1,2,3,4,5] 5)

containsFront = 
  testCase "[1,2,3,4,5] contains 1" $ assertBool [] (contains [1,2,3,4,5] 1)

containsMid = 
  testCase "[1,2,3,4,5] contains 3" $ assertBool [] (contains [1,2,3,4,5] 3)

containsOne =
  testCase "[3] contains 3" $ assertBool [] (contains [3] 3)

containsFalse =
  testCase "[1,2,3,4,5] NOT contain 6" $ assertBool [] (not (contains [1,2,3,4,5] 6))

--------------------------------------------------------------------------
------------------------------- INSERT TESTS -----------------------------

insertEmpty =
  testCase "Insert 3 into []" $ assertEqual [] [3] (insert 3 [])

insertRear =
  testCase "Insert 5 into [1,2,3,4]" $ assertEqual [] [1,2,3,4,5] (insert 5 [1,2,3,4])

insertFront =
  testCase "Insert 1 into [2,3,4,5]" $ assertEqual [] [1,2,3,4,5] (insert 1 [2,3,4,5])

insertMid =
  testCase "Insert 3 into [1,2,4,5]" $ assertEqual [] [1,2,3,4,5] (insert 3 [1,2,4,5])

insertDuplicate =
  testCase "Insert 3 into [1,2,3,4,5]" $ assertEqual [] [1,2,3,4,5] (insert 1 [1,2,3,4,5])

--------------------------------------------------------------------------
------------------------------ ISSUBSET TESTS ----------------------------

-- Empty Empty
isSubsetEE =
  testCase "[] subset []?" $ assertBool [] (isSubSet [] [1,2])

-- Empty Non-empty
isSubsetEN =
  testCase "[] subset [1,2]?" $ assertBool [] (isSubSet [] [1,2])

-- Non-empty Empty
isSubsetNE =
  testCase "[1,2] subset []?" $ assertBool [] (not (isSubSet [1,2] []))

isSubsetFront =
  testCase "[1,2] subset [1,2,3,4,5]?" $ assertBool [] (isSubSet [1,2] [1,2,3,4,5])

isSubsetRear =
  testCase "[4,5] subset [1,2,3,4,5]?" $ assertBool [] (isSubSet [4,5] [1,2,3,4,5])

isSubsetMid =
  testCase "[3,4] subset [1,2,3,4,5]?" $ assertBool [] (isSubSet [3,4] [1,2,3,4,5])

isSubsetDisconnect =
  testCase "[1,3,5] subset [1,2,3,4,5]?" $ assertBool [] (isSubSet [1,3,5] [1,2,3,4,5])

isSubsetPartial =
  testCase "[1,2,7] subset [1,2,3,4,5]?" $ assertBool [] (not (isSubSet [1,2,7] [1,2,3,4,5]))

--------------------------------------------------------------------------
------------------------------- UNION TESTS ------------------------------

unionSame =
  testCase "[1,2,7] union [1,2,7]?" $ assertEqual [] [1,2,7] (union [1,2,7] [1,2,7])

unionOrder =
  testCase "[1,2,3] union [4,5,6]?" $ assertEqual [] [1,2,3,4,5,6] (union [1,2,3] [4,5,6])

unionSwitch =
  testCase "[4,5,6] union [1,2,3]?" $ assertEqual [] [1,2,3,4,5,6] (union [4,5,6] [1,2,3])

unionInter =
  testCase "[4,5,6] union [1,2,3,7]?" $ assertEqual [] [1,2,3,4,5,6,7] (union [4,5,6] [1,2,3,7])

unionEN =
  testCase "[] union [1,2]?" $ assertEqual [] [1,2] (union [] [1,2])

unionNE =
  testCase "[1,2] union []?" $ assertEqual [] [1,2] (union [1,2] [])

--------------------------------------------------------------------------
--------------------------- INTERSECTION TESTS ---------------------------


intersectionEE =
  testCase "[] intersect []?" $ assertEqual [] [] (intersection [] [])

intersectionNE =
  testCase "[1,2] intersect []?" $ assertEqual [] [] (intersection [1,2] [])

intersectionEN =
  testCase "[] intersect [1,2]?" $ assertEqual [] [] (intersection [] [1,2])

intersectionFront =
  testCase "[1,2,78] intersect [1,2,3,4]?" $ assertEqual [] [1,2] (intersection [1,2,78] [1,2,3,4])

intersectionRear =
  testCase "[1,78,79] intersect [2,3,78,79]?" $ assertEqual [] [78,79] (intersection [1,78,79] [2,3,78,79])

intersectionMid =
  testCase "[1,2,34,35,79] intersect [5,6,34,35,102,103]?" $ assertEqual [] [34,35] (intersection [1,2,34,35,79] [5,6,34,35,102,103])

intersectionSame =
  testCase "[1,2,3,4] intersect [1,2,3,4]?" $ assertEqual [] [1,2,3,4] (intersection [1,2,3,4] [1,2,3,4])

intersectionFalse =
  testCase "[1,2,3,4] intersect [6,7,8]?" $ assertEqual [] [] (intersection [1,2,3,4] [6,7,8])

intersectionDisconnect =
  testCase "[1,2,3,4,5,6] intersect [2,5,7]?" $ assertEqual [] [2,5] (intersection [1,2,3,4,5,6] [2,5,7])












