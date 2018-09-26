module MiniGoogle where

import IndexTree

import Data.Char
import Data.List(nub,sortBy)
import Data.Function(on)



--- Example 3: Mini Google
--- Takes a String and a list of Strings and returns
--- the best match among the Strings


-- put in lower case, eliminate punctuation and break into list of words

punctuation = ".,!?()"

cleanup :: String -> String
cleanup [] = []
cleanup (c:cs) | (elem c punctuation) = ' ':(cleanup cs)
cleanup (c:cs) = toLower(c):(cleanup cs)

-- return how many occurrences of a word in a list of words

count :: [String] -> String -> Float
count [] _                  = 0.0
count (s:ss) str | str == s = 1.0 + (count ss str)
count (_:ss) str            = count ss str

get_vocab s t = (nub (words (s ++ " " ++ t)))

term_frequency_list s t = 
    (  (map (count (words (cleanup s))) (get_vocab s t)),
       (map (count (words (cleanup t))) (get_vocab s t))
    )

dot_product :: [Float] -> [Float] -> Float
dot_product [] [] = 0
dot_product (i:is) (j:js) = (i*j) + (dot_product is js)
dot_product _ _ = 0.0


cosine_similarity :: ([Float],[Float]) -> Float
cosine_similarity (tf1,tf2)
    = (dot_product tf1 tf2) / (((dot_product tf1 tf1)**0.5) * ((dot_product tf2 tf2)**0.5))


-- calculate the cosine similarity of two strings s and t

cs s t = cosine_similarity  (term_frequency_list s t)

-- form pair of second string and cs of s and t

add_cs :: String -> String -> (String, Float)
add_cs s t = (t,(cs s t))

-- apply to list of potential matches to preserve cs

add_cs_list :: String -> [String] -> [(String,Float)]
add_cs_list s db = map (add_cs s) db

-- return pair in list with largest second component

biggest :: [(String,Float)] -> (String,Float)
biggest [(s,f)] = (s,f)
biggest ((s,f):(s2,f2):rest) | (f>f2) = biggest ((s,f):rest)
biggest ((s,f):(s2,f2):rest)          = biggest ((s2,f2):rest)


-- get string in db with highest cs to query string

get_best_match query db = biggest (add_cs_list query db)

a = "a c c d"
b = "a b b d e"

db = ["a b b c b a", "a b c c", "b b c", " b a b a c c" ]

query = "a b c"

-- try get_best_match query db