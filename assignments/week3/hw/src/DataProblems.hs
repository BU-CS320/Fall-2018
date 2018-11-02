module DataProblems where

-- Define a datatype for deserts: deserts consist of cake, cookies, and icecream.  Cookies have a number (how many?), Icecream can be flavored like anything (a string), and cake must be flavored like a desert.

data Deserts -- = ... deriving Show

favorite :: Deserts
favorite = undefined

dontLike :: Deserts
dontLike = undefined


willILikeIt :: Deserts -> Bool
willILikeIt = undefined


-- Define a datatype for a student at BU. Students should have a first name, a last name, a BU ID, a major, and a class year (Freshman, etc.). Names and the BU ID should be Strings, and the others should be represented by other datatypes (you can pick five majors as examples). </p>

data Student -- deriving Show

me :: Student
me = undefined

-- Make a student from a first name, a last name, a BU ID, and a class year.  This functions should just return "CS" majors.
mkStudent :: String -> String -> String -> Integer -> Maybe Student
mkStudent  = undefined
