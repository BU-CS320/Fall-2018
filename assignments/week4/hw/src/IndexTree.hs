module IndexTree(IndexTree(Null), insert, lookupKey, member, keys, pairs, invert) where  -- DO NOT EDIT THIS LINE
    
        

-- Index Table and Inverted Index Table

-- For this problem, you must develop a variation of a dictionary
-- called an index table (or sometimes just "index"); this is exactly
-- the same as a dictionary, except that it must have a list of values
-- associated with it instead of just a single value. Such a data
-- structure is very useful in a wide variety of applications, such
-- as concordances. 
-- In particular, you can "invert" such a tree to create a reverse index. 


data IndexTree k v = Null | Node (IndexTree k v) k [v] (IndexTree k v)  deriving Show

-- insert attempts to put a key and value in the index;
--     if the key is not there, it adds key and [value];
--     if key is there, but value not, it adds value to list of values;
--     if key and value there, does nothing

insert :: Ord k => Ord v => k -> v -> (IndexTree k v) -> (IndexTree k v)
insert = undefined


-- lookup returns list of values associated with a key, in any order, no repeates

lookupKey :: Ord k => k -> IndexTree k v -> [v]
lookupKey  = undefined

-- member returns True if key and value in the tree

member :: Ord k => Eq v => k -> v -> (IndexTree k v) -> Bool
member  = undefined



-- keys returns list of keys in the tree, in sorted order least to greatest

keys :: Ord k => (IndexTree k v) -> [k]
keys  = undefined


-- pairs returns a list of (key,value) pairs for each in the index tree in any order
pairs :: (IndexTree k v)  -> [(k,v)]
pairs  = undefined



-- invert takes an index tree, and creates a new index tree with the values as keys
-- and keys as values; note that since we don't want to use state, we'll do this
-- using list processing only

invert :: Ord k => Ord v => (IndexTree k v)  -> (IndexTree v k)
invert  = undefined


-- when are 2 IndexTrees equal?
instance (Ord k, Eq v) => Eq (IndexTree k v) where
  x == y = undefined

  
instance Functor (IndexTree k) where
--  fmap :: (a -> b) -> (IndexTree k a) -> (IndexTree k b)
  fmap f _ = undefined
  
-- helper functions you may choose to implement

flip' (x,y)  = undefined

invertHelper :: Ord k => Ord v =>  [(k,v)] -> (IndexTree k v) -> (IndexTree k v)
invertHelper  = undefined


-- an example

t = invertHelper [( "a","1"), ("b","2"),("c","3"),("a","3"),("b","5")] Null

tinv = invert t
