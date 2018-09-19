module HigherOrderProblems where
import DataProblems

			
-- HO programming using map and filter

-- I will give them map and filter in lecture on Tuesday

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = (f x) : (map' f xs)

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs) =
   if   (p x)
   then x : (filter' p xs)
   else filter' p xs


returnEven ::  [Integer] -> [Integer]
returnEven x = filter (undefined) x


repeat10Times :: [String] -> [String]
repeat10Times x = map (undefined) x

-- take a list of students and return a list of thier names and years
toNameYear :: [Student] -> [(String,Integer)]
toNameYear x = map (undefined) x