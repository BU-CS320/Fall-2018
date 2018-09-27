module IndexAndConcordance where 
import IndexTree

import Data.Char
        

-- Concordance Builder: an example of using index tree

-- Suppose you have a book, and you want to create an concordance,
-- i.e., a list of words and page numbers where those words
-- appear. One way to do this is to create an index giving
-- all the words on each page, using the page number as
-- key (starting at 1), and all the words on that page as the value. Then,
-- when you invert the index you have--voila!--a keys
-- which are words, and values which are lists of page
-- numbers where those words occur. In this problem we will
-- do a toy version of this process, using a simplified
-- version of a "book."

-- A book is a list of strings, each string representing the
-- text on the page. We will remove punctuation and change
-- all letters to lower case, and then split it Integero words.


book = [ "This, to start, is the first page.", "This is the second page of two!", "This is the third of three." ]

punctuation = ".,!?()-_"

-- Replace all punctuation as just defined with spaces and 
-- changes all upper-case letters to lower. 
-- HInteger:  use elem from the Prelude and toLower from Data.Char
-- Example:
--   >  cleanup "hi there,this is Wayne,--er,Prof Snyder!"
--   >  "hi there this is wayne   er prof snyder "

cleanup :: String -> String
cleanup = undefined


-- This takes a list of strings, and creates a list of cleaned up lists of words on each page
-- HInteger:  map cleanup and words (from Prelude) over the list.
-- Example:
-- > createWordLists ["hi there this is wayne", "   er prof snyder "]
-- > [["hi","there","this","is","wayne"],["er","prof","snyder"]]

createWordLists :: [String] -> [[String]]
createWordLists = undefined

-- Now take the list of words, and replace it with a list of (key,value) pairs
-- with key being the page number (starting at 1) and value being the list of words.
-- You may find it useful to define a helper function. 
-- Example:
-- > makePairs [["hi","there","this","is","wayne"],["er","prof","snyder"]]
-- > [(1,["hi","there","this","is","wayne"]),(2,["er","prof","snyder"])]


makePairs :: [[String]] -> [(Integer,[String])]
makePairs = undefined

-- Now create a function to map this over each list to make a list of (Integer,String) pages for insertion in index tree
-- Example:
-- > addPageNumber (1,["hi","there","this","is","wayne"])
-- > [(1,"hi"),(1,"there"),(1,"this"),(1,"is"),(1,"wayne")]


addPageNumber :: (Integer,[String]) -> [(Integer,String)]
addPageNumber  = undefined


-- Now create a list of all such pairs for all pages: simply map the previous function over all
-- lists of words, and then flatten (you wrote this for another part of the assignment, you can
-- copy it here if wish) to create a list of all (n,w) pairs for page number n and word w.
-- HInteger: compose all the previous ideas. 

createWordList :: [String] -> [(Integer, String)]
createWordList = undefined

-- Now write a function to insert a list of pairs Integero an index tree

insertAll :: [(Integer, String)] ->  IndexTree Integer String
insertAll = undefined


-- Now create the tree and then invert it

makeConcordance b = undefined

-- NOTE: you could have simply flipped the pairs after creating the word list, and this would give you
-- the inverted index, but it is possible you want the original tree as well (both are common and
-- useful in literary studies). In any case, it is one approach out of several equally valid.
-- Please do it our way for now!



c = makeConcordance book

-- Try the following:
-- lookupKey "start" c 
