module BinarySearchTrees(Tree(Null), size, member, insert, toList, eq, treeMin, delete) where 


-- Binary search trees

data Tree = Null | Node Tree Integer Tree deriving Show

size :: Tree -> Integer
size = undefined

member :: Integer -> Tree -> Bool
member = undefined

		 
insert :: Integer -> Tree -> Tree
insert  = undefined

toList :: Tree -> [Integer]
toList  = undefined



eq :: Tree -> Tree -> Bool
eq  = undefined





treeMin :: Tree -> Maybe Integer
treeMin = undefined


-- private things



-- Delete a Integer from a tree
deleteMin :: Tree -> Tree
deleteMin  = undefined

delete :: Integer -> Tree -> Tree
delete  = undefined


			
			
			