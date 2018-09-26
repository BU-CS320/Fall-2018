module HigherOrderProblems where

-- this forces you to work with our more annoying lists, DO NOT CHANGE THE FOLLOWING 2 LINES
import Prelude hiding (map, foldr, length) 
import AnnoyingLists


{-   This problem is a collection of functions exercising your
     knowledge of higher-order programming. Follow the instructions
     for each function.

     NOTE: It is EXPECTED that you will not know absolutely everything
     about some of the functions (or the list comprehensions) referenced
     below, but that you know how to use the references given on the
     class web page, or Google, to find out the relevant information
     needed to complete the problems. :-)

-}





-- (A) -- (F) Reimplement each of the following on annoying lists. 

problemA xs    = [ x+1 | x <- xs ]
solutionA :: AnnoyingList Integer -> AnnoyingList Integer
solutionA = undefined

problemB xs    = [ x*2 | x <- xs, x > 2 ]
solutionB :: AnnoyingList Integer -> AnnoyingList Integer
solutionB = undefined


problemC xys   = [ 1/x | (x,_) <- xys ]
solutionC :: AnnoyingList (Integer, Integer) -> AnnoyingList Float
solutionC = undefined


problemD xys   = [ (-x) | (x,y) <- xys, x+y < 5 ]
solutionD ::  AnnoyingList (Integer, Integer) -> AnnoyingList Integer
solutionD = undefined

problemE xs ys = [ x+y | x <- xs, y <- ys ]
solutionE ::  AnnoyingList Integer -> AnnoyingList Integer -> AnnoyingList Integer
solutionE = undefined

problemF mxs   = [ x^2 | Just x <- mxs ]
solutionF :: AnnoyingList (Maybe Integer) ->  AnnoyingList Integer
solutionF = undefined





-- (G) Implement length 

length :: AnnoyingList a -> Integer
length = undefined

-- (H) Implement append

append :: AnnoyingList a  -> AnnoyingList a -> AnnoyingList a
append = undefined




-- (I) longest takes a list of strings and returns the length
--     of the longest member string.

longest :: AnnoyingList (AnnoyingList Char) -> Maybe Integer
longest = undefined

-- (J) Now define flatten which does the same thing as concat to but to a list of lists
flatten :: AnnoyingList (AnnoyingList a) -> (AnnoyingList a) 
flatten = undefined

-- (K)  Define a function remove which takes two
--      strings as its arguments and removes every letter from the
--      second list that occurs in the first list. For
--      example, remove "first" "second" = "econd"

remove :: (AnnoyingList Char) -> (AnnoyingList Char) -> (AnnoyingList Char)
remove  = undefined


-- (L) Write average, which takes a list of Floats and returns
--     the average

average :: (AnnoyingList Float) -> Maybe Float
average = undefined


-- Write min_list, which returns the smallest element
-- in a list of positive numbers; it should return 0
-- for the empty list. It should use foldr and the
-- built-in function min. 

min_list :: (Ord a,Num a) => (AnnoyingList a) -> a
min_list lst = undefined


-- Using the following function (what does it do??)
-- write an insertion sort function using only foldr and f

f x xs = [ y | y <- xs, y < x] ++ [x] ++ [z | z <- xs, z >= x]
insertsort :: Ord a => (AnnoyingList a) -> (AnnoyingList a)
insertsort lst  = undefined




