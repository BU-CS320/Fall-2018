module Main where
import Hw

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

main = defaultMain unitTests

unitTests =
  testGroup
    "Tests"
    [andTrueTrue, 
    mult3and5,
    distance0,
    distanceVertical,
    distanceHorizontal,
    distancePosSlope,
    distanceNegslope,
    testEqList,
    testAppend,
    testRev,
    testSum,
    testSize,
    testHeight,
    testInorder,
    testPreorder,
    testMemberTreeNat,
    testEqTreeNat]
    

-- this function converts from our custom Bools to the standard Bools so we have a lot of automatic things already defined
fromhwBoolToStandardBool :: Hw.Bool -> Prelude.Bool
fromhwBoolToStandardBool Hw.True  = Prelude.True
fromhwBoolToStandardBool Hw.False = Prelude.False

-- this function converts from our custom Nats to the standard Integers so we have a lot of automatic things already defined
fromNatToInteger :: Nat -> Integer
fromNatToInteger Zero     = 0
fromNatToInteger (Succ n) = 1 + (fromNatToInteger n)

-- this function converts from our List to the standard List so we have a lot of automatic things already defined
fromhwListToStandardList :: Hw.List a -> [a]
fromhwListToStandardList Nil      = []
fromhwListToStandardList (Cons x y) = x:fromhwListToStandardList y

-- and True True = True
andTrueTrue =
  testCase "or True True = True" $ assertBool [] (fromhwBoolToStandardBool (Hw.or Hw.True Hw.True))

-- the defined numbers should add the correct way
mult3and5 =
  testCase "3 * 5 = 15" $ assertEqual [] 15 (fromNatToInteger (Hw.mult Hw.three Hw.five))

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------- MANHATTANDISTANCE TESTS ----------------------

-- manhattanDistance of the same point = 0
distance0 =
  testCase "Distance between (1,2) and (1,2)" $ assertEqual [] 0 (fromNatToInteger(Hw.manhattanDistance (Hw.makePoint Hw.one Hw.two) (Hw.makePoint Hw.one Hw.two)))

-- Vertical Distance (9, 3) (9, 9) = 6
distanceVertical =
  testCase "Distance between (9, 3) and (9, 9)" $ assertEqual [] 6 (fromNatToInteger(Hw.manhattanDistance (Hw.makePoint Hw.nine Hw.three) (Hw.makePoint Hw.nine Hw.nine)))


-- Horizontal Distance (3, 9) (9, 9) = 6
distanceHorizontal =
  testCase "Distance between (3, 9) and (9, 9)" $ assertEqual [] 6 (fromNatToInteger(Hw.manhattanDistance (Hw.makePoint Hw.three Hw.nine) (Hw.makePoint Hw.nine Hw.nine)))

-- Positive Slope (1, 2) (3, 4) = 4
distancePosSlope =
  testCase "Distance between (1, 2) and (3, 4)" $ assertEqual [] 4 (fromNatToInteger(Hw.manhattanDistance (Hw.makePoint Hw.one Hw.two) (Hw.makePoint Hw.three Hw.four)))

-- Negative Slope (1, 5) (2, 3) = 3
distanceNegslope =
  testCase "Distance between (1, 5) and (2, 3)" $ assertEqual [] 3 (fromNatToInteger(Hw.manhattanDistance (Hw.makePoint Hw.one Hw.five) (Hw.makePoint Hw.two Hw.three)))

------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------------- LIST --------------------------------

-- [1,2,3,4,5] = [1,2,3,4,5]
testEqList =
  testCase "Same list -> True" $ assertBool [] (fromhwBoolToStandardBool(
    Hw.eq_list
    (ConsNat Hw.one (ConsNat Hw.two (ConsNat Hw.three (ConsNat Hw.four (ConsNat Hw.five ((NilNat)))))))
    (ConsNat Hw.one (ConsNat Hw.two (ConsNat Hw.three (ConsNat Hw.four (ConsNat Hw.five ((NilNat)))))))
    ))

-- append [1,2,3,4,5] to [1,2,3,4,5]
-- expected: [1,2,3,4,5,1,2,3,4,5]
testAppend =
  testCase "List Append" $ assertEqual [] [1,2,3,4,5,1,2,3,4,5] (fromhwListToStandardList(
    Hw.append
    (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 ((Nil)))))))
    (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 ((Nil)))))))
    ))

-- Reverse [1,2,3,4,5] = [5,4,3,2,1]
testRev =
  testCase "List Reverse" $ assertEqual [] [5, 4, 3, 2, 1] (fromhwListToStandardList (Hw.rev (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 ((Nil)))))))))

-- Sum [1,2,3,4,5] = 15
testSum =
  testCase "Sum ListNat" $ assertEqual [] 15 (fromNatToInteger(Hw.sum (ConsNat Hw.one (ConsNat Hw.two (ConsNat Hw.three (ConsNat Hw.four (ConsNat Hw.five ((NilNat)))))))))

------------------------------------------------------------------------
------------------------------------------------------------------------
--------------------------------- TREE ---------------------------------

--      1
--    /   \
--   2     3
--  / \   / \
-- 4   5 6   7
--            \
--             8
--
-- Size    : 8
-- Height  : 4
-- Inorder : 4 2 5 1 6 3 7 8
-- Preorder: 1 2 4 5 3 6 7 8

-- test Size
testSize =
  testCase "Tree Size = 8" $ assertEqual [] 8 (fromNatToInteger(Hw.size (Node (Node (Node Null 4 Null) 2 (Node Null 5 Null)) 1 (Node (Node Null 6 Null) 3 (Node Null 7 (Node Null 8 Null))))))

-- test Height
testHeight =
  testCase "Height = 4" $ assertEqual [] 4 (fromNatToInteger(Hw.height (Node (Node (Node Null 4 Null) 2 (Node Null 5 Null)) 1 (Node (Node Null 6 Null) 3 (Node Null 7 (Node Null 8 Null))))))

-- test Inorder
testInorder = 
  testCase "Inorder Traversal" $ assertEqual [] [4, 2, 5, 1, 6, 3, 7, 8] (fromhwListToStandardList(
    Hw.inorder 
    (Node (Node (Node Null 4 Null) 2 (Node Null 5 Null)) 1 (Node (Node Null 6 Null) 3 (Node Null 7 (Node Null 8 Null))))
    ))

-- test Preorder
testPreorder =
  testCase "Preorder Traversal" $ assertEqual [] [1, 2, 4, 5, 3, 6, 7, 8] (fromhwListToStandardList(
    Hw.preorder 
    (Node (Node (Node Null 4 Null) 2 (Node Null 5 Null)) 1 (Node (Node Null 6 Null) 3 (Node Null 7 (Node Null 8 Null))))
    ))

-- test memberTreeNat
testMemberTreeNat =
  testCase "8 is a member" $ assertBool [] (fromhwBoolToStandardBool(
    Hw.memberTreeNat
    (Succ (Succ Hw.six))
    (NodeNat (NodeNat (NodeNat NullNat Hw.four NullNat) Hw.two (NodeNat NullNat Hw.five NullNat)) Hw.one (NodeNat (NodeNat NullNat Hw.six NullNat) Hw.three (NodeNat NullNat (Succ (Hw.six)) (NodeNat NullNat (Succ (Succ (Hw.six))) NullNat))))
    ))

-- test EqTreeNat
testEqTreeNat =
  testCase "Same Tree" $ assertBool [] (fromhwBoolToStandardBool(
    Hw.eqTreeNat
    (NodeNat (NodeNat (NodeNat NullNat Hw.four NullNat) Hw.two (NodeNat NullNat Hw.five NullNat)) Hw.one (NodeNat (NodeNat NullNat Hw.six NullNat) Hw.three (NodeNat NullNat (Succ (Hw.six)) (NodeNat NullNat (Succ (Succ (Hw.six))) NullNat))))
    (NodeNat (NodeNat (NodeNat NullNat Hw.four NullNat) Hw.two (NodeNat NullNat Hw.five NullNat)) Hw.one (NodeNat (NodeNat NullNat Hw.six NullNat) Hw.three (NodeNat NullNat (Succ (Hw.six)) (NodeNat NullNat (Succ (Succ (Hw.six))) NullNat))))
    ))


