module IndexTreeBad(IndexTree(),empty, insert, Compare(LessThan, EqualTo, GreaterThan),Ordering(Ordering) ) where 
import Prelude hiding (lookup, elem, Ordering)

data Compare = LessThan | EqualTo | GreaterThan

data Ordering a = Ordering (a -> a -> Compare)



-- Example 2: Index Table and Inverted Index Table

-- For this problem, you must develop a variation of a dictionary
-- called an index table (or sometimes just "index"); this is exactly
-- the same as a dictionary, except that it must have a list of values
-- associated with it instead of just a single value. Such a data
-- structure is very useful in a wide variety of applications, such
-- as concordances. 
-- In particular, you can "invert" such a tree to create a reverse index. 



data IndexTree k v = IndexTree  (Ordering k) (Ordering v) (IndexTreeInner k v) 



data IndexTreeInner k v = Null | Node (IndexTreeInner k v) k [v] (IndexTreeInner k v) 


empty ::  (Ordering k) -> (Ordering v) -> IndexTree k v  
empty = undefined


-- helper functions that might be helpful
elem :: Ordering a -> a -> [a] -> Bool
elem = undefined


insertHelper :: (Ordering k) -> (Ordering v) -> k -> v -> (IndexTreeInner k v ) -> (IndexTreeInner k v )
insertHelper = undefined



-- insert attempts to put a key and value in the index;
--     if the key is not there, it adds key and [value];
--     if key is there, but value not, it adds value to list of values;
--     if key and value there, does nothing

                                                                                   
insert :: k -> v -> (IndexTree k v ) -> (IndexTree k v )
insert = undefined

-- sooo much work...
