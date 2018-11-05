<<<<<<< HEAD
module ParserMonad where
import Control.Monad(ap)

import Data.Char

-- the type of a parser
-- these are the same as last time, but we wrap it in a data so we can define typeclasses on it
data Parser a = Parser (String -> Maybe (a, String))

-- a helper function to pull out the function bit (same as book)
parse :: Parser a -> (String -> Maybe (a, String))
parse (Parser f) = f


instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap f (Parser pa) = undefined
-- hint:  pa :: String -> Maybe (a, String)
-- hint:  similar to State monad

-- think, "does it follow the Functor laws?"

--ignore this for now
instance Applicative Parser where
  pure = return
  (<*>) = ap

instance Monad Parser where
  --return :: a -> Parser a
  return a = undefined

  --(>>=) :: Parser a -> (a -> Parser b) -> Parser b
  (Parser pa) >>= f = undefined
-- hints:
-- pa :: String -> Maybe (a, String)
-- f :: a -> Parser b

-- think, "does it follow the Monad laws?"



-- parse one thing, if that works then parse the other thing
(+++) :: Parser a -> Parser b -> Parser (a,b)
pa +++ pb =  undefined

-- read in a char (from book)
item :: Parser Char
item = Parser $ \ input -> case input of ""    -> Nothing
                                         (h:t) -> Just (h, t)


-- a parser that always fails (empty in the book)
failParse :: Parser a
failParse = Parser $ \ input -> Nothing


-- read in a char if it passes a test, (from book)
sat :: (Char -> Bool) -> Parser Char
sat p = do c <- item
           if p c
           then return c
           else failParse


-- parse exactly a string, return that string (in book as the poorly named "string")
literal :: String -> Parser String
literal "" = return ""
literal (h:t) = do sat (==h)
                   literal t
                   return (h:t)

-- for example:
-- *ParserMonad> parse (literal "blahh") "blahhhhhh"
-- Just ("blahh","hhhh")



exampleParser' = do literal "Let"
                    name <- literal "x" -- in real life this would be a var parser
                    literal "="
                    nat <- literal "2" -- in real life this would be an Ast parser
                    literal "in"
                    body <- literal "3" --in real life this would be an Ast parser
                    return (name, nat, body) -- in real life this would call the right constructor

-- for example:
-- *ParserMonad> parse exampleParser' "Letx=2in3"
-- Just (("x","2","3"),"")



--try to parse a, if that doesn't work try to parse b (slightly different from the book)
(<|>) :: Parser a -> Parser b -> Parser (Either a b)
parserA <|> parserB = Parser $ \ input ->  case parse parserA input of
                                                 Just (a, rest) -> Just (Left a, rest)
                                                 Nothing -> case parse parserB input of
                                                              Just (b, rest) -> Just (Right b, rest)
                                                              Nothing        -> Nothing

-- for example:
-- *ParserMonad> parse (literal "aa" <|> literal "bb") "aaaa"
-- Just (Left "aa","aa")
-- *ParserMonad> parse (literal "aa" <|> literal "bb") "bbb"
-- Just (Right "bb","b")




-- take a parser and parse as much as possible into a list, always parse at least 1 thing, (from book)
some :: Parser a -> Parser ([a])
some pa = do a <- pa
             rest <- rep pa
             return (a:rest)

-- for example:
-- *ParserMonad> parse (some (literal "blahh")) "blahhhhhh"
-- Just (["blahh"],"hhhh")
-- *ParserMonad> parse (some (literal "blahh")) "blahhblahhblahhblahhhhhh"
-- Just (["blahh","blahh","blahh","blahh"],"hhhh")
-- *ParserMonad> parse (some (literal "blahh")) "important instructions"
-- Nothing



-- take a parser and parse as much as possible into a list, (in book as "many")
rep :: Parser a -> Parser ([a])
rep pa =  do res <- (some pa) <|> (return [])
             case res of Left ls  -> return ls
                         Right ls -> return ls


-- for example:
-- *ParserMonad> parse (rep (literal "blahh")) "blahhhhhh"
-- Just (["blahh"],"hhhh")
-- *ParserMonad> parse (rep (literal "blahh")) "blahhblahhblahhblahhhhhh"
-- Just (["blahh","blahh","blahh","blahh"],"hhhh")
-- *ParserMonad> parse (rep (literal "blahh")) "important instructions"
-- Just ([],"important instructions")


-- parse a digit (from book)
digit :: Parser Char
digit = sat isDigit


-- parse natural numbers, like "123", or "000230000"
natParser :: Parser Integer
natParser =  do digits <- rep digit
                return $ read digits

-- for example:
-- *ParserMonad> parse natParser "12345"
-- Just (12345,"")


--parse spaces, throw them away
spaces :: Parser ()
spaces =  do rep (sat isSpace)
             return ()

-- a nicer version of eat spaces, eat the spaces before or after the parser (from book)
token:: Parser a -> Parser a
token pa = do spaces
              a <- pa
              spaces
              return a



-- parse what we will consider a good variable name
-- hint:  look up isAlpha
-- hint:  you can do it like natParser
varParser :: Parser String
varParser =  undefined

exampleParser = do token $ literal "Let"
                   name <- varParser
                   token $ literal "="
                   nat <- natParser --in real life this would be an Ast parser
                   token $ literal "in"
                   body <- natParser --in real life this would be an Ast parser
=======
module ParserMonad where
import Control.Monad(ap)

import Data.Char

-- the type of a parser
-- these are the same as last time, but we wrap it in a data so we can define typeclasses on it
data Parser a = Parser (String -> Maybe (a, String))

-- a helper function to pull out the function bit (same as book)
parse :: Parser a -> (String -> Maybe (a, String))
parse (Parser f) = f


instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap f (Parser pa) = undefined
-- hint:  pa :: String -> Maybe (a, String)
-- hint:  similar to State monad

-- think, "does it follow the Functor laws?"

--ignore this for now
instance Applicative Parser where
  pure = return
  (<*>) = ap

instance Monad Parser where
  --return :: a -> Parser a
  return a = undefined

  --(>>=) :: Parser a -> (a -> Parser b) -> Parser b
  (Parser pa) >>= f = undefined
-- hints:
-- pa :: String -> Maybe (a, String)
-- f :: a -> Parser b

-- think, "does it follow the Monad laws?"



-- parse one thing, if that works then parse the other thing
(+++) :: Parser a -> Parser b -> Parser (a,b)
pa +++ pb =  undefined

-- read in a char (from book)
item :: Parser Char
item = Parser $ \ input -> case input of ""    -> Nothing
                                         (h:t) -> Just (h, t)


-- a parser that always fails (empty in the book)
failParse :: Parser a
failParse = Parser $ \ input -> Nothing


-- read in a char if it passes a test, (from book)
sat :: (Char -> Bool) -> Parser Char
sat p = do c <- item
           if p c
           then return c
           else failParse


-- parse exactly a string, return that string (in book as the poorly named "string")
literal :: String -> Parser String
literal "" = return ""
literal (h:t) = do sat (==h)
                   literal t
                   return (h:t)

-- for example:
-- *ParserMonad> parse (literal "blahh") "blahhhhhh"
-- Just ("blahh","hhhh")



exampleParser' = do literal "Let"
                    name <- literal "x" -- in real life this would be a var parser
                    literal "="
                    nat <- literal "2" -- in real life this would be an Ast parser
                    literal "in"
                    body <- literal "3" --in real life this would be an Ast parser
                    return (name, nat, body) -- in real life this would call the right constructor

-- for example:
-- *ParserMonad> parse exampleParser' "Letx=2in3"
-- Just (("x","2","3"),"")



--try to parse a, if that doesn't work try to parse b (slightly different from the book)
(<|>) :: Parser a -> Parser b -> Parser (Either a b)
parserA <|> parserB = Parser $ \ input ->  case parse parserA input of
                                                 Just (a, rest) -> Just (Left a, rest)
                                                 Nothing -> case parse parserB input of
                                                              Just (b, rest) -> Just (Right b, rest)
                                                              Nothing        -> Nothing

-- for example:
-- *ParserMonad> parse (literal "aa" <|> literal "bb") "aaaa"
-- Just (Left "aa","aa")
-- *ParserMonad> parse (literal "aa" <|> literal "bb") "bbb"
-- Just (Right "bb","b")




-- take a parser and parse as much as possible into a list, always parse at least 1 thing, (from book)
some :: Parser a -> Parser ([a])
some pa = do a <- pa
             rest <- rep pa
             return (a:rest)

-- for example:
-- *ParserMonad> parse (some (literal "blahh")) "blahhhhhh"
-- Just (["blahh"],"hhhh")
-- *ParserMonad> parse (some (literal "blahh")) "blahhblahhblahhblahhhhhh"
-- Just (["blahh","blahh","blahh","blahh"],"hhhh")
-- *ParserMonad> parse (some (literal "blahh")) "important instructions"
-- Nothing



-- take a parser and parse as much as possible into a list, (in book as "many")
rep :: Parser a -> Parser ([a])
rep pa =  do res <- (some pa) <|> (return [])
             case res of Left ls  -> return ls
                         Right ls -> return ls


-- for example:
-- *ParserMonad> parse (rep (literal "blahh")) "blahhhhhh"
-- Just (["blahh"],"hhhh")
-- *ParserMonad> parse (rep (literal "blahh")) "blahhblahhblahhblahhhhhh"
-- Just (["blahh","blahh","blahh","blahh"],"hhhh")
-- *ParserMonad> parse (rep (literal "blahh")) "important instructions"
-- Just ([],"important instructions")


-- parse a digit (from book)
digit :: Parser Char
digit = sat isDigit


-- parse natural numbers, like "123", or "000230000"
natParser :: Parser Integer
natParser =  do digits <- some digit
                return $ read digits

-- for example:
-- *ParserMonad> parse natParser "12345"
-- Just (12345,"")


--parse spaces, throw them away
spaces :: Parser ()
spaces =  do rep (sat isSpace)
             return ()

-- a nicer version of eat spaces, eat the spaces before or after the parser (from book)
token:: Parser a -> Parser a
token pa = do spaces
              a <- pa
              spaces
              return a



-- parse what we will consider a good variable name
-- hint:  look up isAlpha
-- hint:  you can do it like natParser
varParser :: Parser String
varParser =  undefined

exampleParser = do token $ literal "Let"
                   name <- varParser
                   token $ literal "="
                   nat <- natParser --in real life this would be an Ast parser
                   token $ literal "in"
                   body <- natParser --in real life this would be an Ast parser
>>>>>>> f83022ebbebc8bff0eac13707b2fd35c52ebfd5d
                   return (name, nat, body) -- in real life this would call the right constructor