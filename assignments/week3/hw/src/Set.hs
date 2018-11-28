module Set (Set, empty, contains, insert, isSubSet, union, intersection) where


type Set = [Integer]


empty :: Set
empty = undefined

contains :: Set -> Integer -> Bool
contains = undefined


insert :: Integer -> Set -> Set
insert = undefined


-- Functions on lists, using built-in lists

isPrefix :: Set -> Set -> Bool
isPrefix = undefined

isSubSet :: Set -> Set -> Bool
isSubSet = undefined


-- find the union of two ordered lists, this is like merge but
-- removing duplicates

union :: Set -> Set -> Set
union = undefined


-- find the intersection of two ordered lists, i.e., the
-- common subsequence

intersection :: Set -> Set -> Set
intersection = undefined
