module ParserMonad where
import Control.Monad(ap)

import Data.Char


-- If your intrestied in this style of parsing look at the parsec, megaparsec, attoparsec libraries

-- the type of a parser
-- these are the same as last time, but we wrap it in a data so we can define typeclasses on it
data Parser a = Parser (String -> Maybe (a, String))

-- a helper function to pull out the function bit (same as book)
parse :: Parser a -> (String -> Maybe (a, String))
parse (Parser f) = f




instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap f (Parser pa) =  Parser $ \ x -> case pa x of
                                          Nothing        -> Nothing
                                          Just (a, rest) -> Just (f a, rest)

--ignore this for now
instance Applicative Parser where
  pure = return
  (<*>) = ap


instance Monad Parser where
  --return :: a -> Parser a
  return a =  Parser $ \ x -> Just (a,x)


  --(>>=) :: Parser a -> (a -> Parser b) -> Parser b
  (Parser pa) >>= f = Parser $ \ x ->  case pa x of
                                         Nothing       -> Nothing
                                         Just (a,rest) -> parse (f a) rest

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


--try to parse a, if that doesn't work try to parse b (slightly different from the book)
(<|>) :: Parser a -> Parser b -> Parser (Either a b)
parserA <|> parserB = Parser $ \ input ->  case parse parserA input of
                                                 Just (a, rest) -> Just (Left a, rest)
                                                 Nothing -> case parse parserB input of
                                                              Just (b, rest) -> Just (Right b, rest)
                                                              Nothing        -> Nothing

-- like <|> but easier on the same type
(<||>) :: Parser a -> Parser a -> Parser a
l <||> r = do res <- l <|> r
              case res of
               Left a -> return a
               Right a -> return a


-- take a parser and parse as much as possible into a list, always parse at least 1 thing, (from book)
some :: Parser a -> Parser ([a])
some pa = do a <- pa
             rest <- rep pa
             return (a:rest)



-- take a parser and parse as much as possible into a list, (in book as "many")
rep :: Parser a -> Parser ([a])
rep pa =  do res <- (some pa) <|> (return [])
             case res of Left ls  -> return ls
                         Right ls -> return ls


-- parse a digit (from book)
digit :: Parser Char
digit = sat isDigit


-- parse natural numbers, like "123", or "000230000"
natParser :: Parser Integer
natParser =  do digits <- some digit
                return $ read digits

intParser  :: Parser Integer
intParser = do r <- (literal "-") <|> natParser
               case r of
                Left _ -> fmap (0-) natParser
                Right n -> return n

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
varParser :: Parser String
varParser = do chars <- some (sat isAlpha)
               return chars



oneOf :: [Parser a] -> Parser a
oneOf [] = failParse
oneOf (pa:rest) = pa <||> oneOf rest


-- we saw before the midterm that there were issues when there are multiple operators with the same precedence, this is a helper function to handle those
-- this generalizes the helper function posted on piaza from last time
-- it is left associative
withInfix :: Parser a -> [(String, a -> a -> a)] -> Parser a
withInfix pa ls = let operators = fmap fst ls
                      opParsers = fmap (\ s -> token $ literal s) operators

                      --innerParser :: a -> Parser a, where a is the same as above
                      innerParser left = do s <- oneOf opParsers
                                            next <- pa
                                            case lookup s ls of
                                             Nothing -> failParse
                                             Just f ->  let out = f left next
                                                        in (innerParser out) <||> return out
                  in do l <- pa
                        (innerParser l) <||> (return l)
