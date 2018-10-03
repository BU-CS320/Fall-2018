module HigherOrderProblems where



-- Write a function sumsq n, which returns the
-- sum of the first n natural numbers: 1^2 + 2^2 + ... + n^2
-- Hint: use foldr, a helper function, and the list 
-- notation [1..n], which is the Haskell version of
-- Pythons range(..).
-- Example:  [1..4] => [1,2,3,4]

sumsqa :: [Integer] -> Integer
sumsqa n = undefined


-- The function remdups removes adjacent duplicates from a list.
-- Define remdups using foldr, with any helper function you need.
-- Example: remdups [1, 2, 2, 3, 3, 3, 1, 1] => [1, 2, 3, 1]

remdups :: Eq a => [a] -> [a]
remdups lst = undefined


-- The function inits returns the list of all substring starting with the
-- first character. 
-- Define inits using foldr and any helper function you need.
-- Hint: the weird slice function (x:) will cons x onto the front of
-- a list (try it!). Use this function with a map in your helper function.
-- Example: inits "cs320" => ["", "c", "cs", "cs3", "cs32", "cs320"]

inits :: [a] -> [[a]]
inits lst = undefined





