module MyParserLib where

import Data.Char

type Parser a = String -> Maybe (a, String)

-- Note we will go over this in lab.  Don't look at this file before lab if you don't want to spoil the surprise


-- parse one thing, if that works then parse the other thing
(+++) :: Parser a -> Parser b -> Parser (a,b)
(pa +++ pb) str = case (pa str) of
                    Nothing         -> Nothing
                    Just (a, rest)  -> case (pb rest) of
                                         Nothing            -> Nothing
                                         Just (b,restrest)  -> Just ((a, b),restrest)



-- parse exactly a string, return that string
literal :: String -> Parser String
literal ""    input = Just ("", input)
literal (h:t) ""    = Nothing
literal (h:t) (inH:inT) = if h == inH
                          then case literal t inT of
                                 Nothing         -> Nothing
                                 Just (_, rest)  -> Just (h:t, rest)
                          else Nothing

simpleParser = (literal "abc") +++ (literal "def")

-- *MyParserLib> simpleParser "abcdef"
-- Just (("abc","def"),"")
-- *MyParserLib> simpleParser "abcdefgh"
-- Just (("abc","def"),"gh")
-- *MyParserLib> simpleParser "abcd"
-- Nothing



-- parse an integer
intParser :: Parser Integer
intParser ""    = Nothing
intParser (h:t) = if isDigit h
                  then let n = read [h] :: Integer
                       in intParserHelper n t
                  else if h == '-'
                       then case intParserHelper 0 t  of
                              Nothing         -> Nothing
                              Just (n, rest)  -> Just (-n, rest)
                       else Nothing
-- given
-- accumulate a number while parsing
intParserHelper :: Integer -> Parser Integer
intParserHelper n ""    = Just (n, "")
intParserHelper n (h:t) = if isDigit h
                          then let next = (read [h] :: Integer)
                               in case intParserHelper (n*10 + next) t of
                                    Nothing          -> Just (n, h:t)
                                    Just (num, rest) -> Just (num, rest)
                          else Just (n, h:t)


-- *MyParserLib> intParserHelper 123 "999xyz"
-- Just (123999,"xyz")


floatParser' = intParser +++ (literal ".") +++ (intParserHelper 0)

-- *MyParserLib> floatParser' "1234.5678 and then some stufff"
-- Just (((1234,"."),5678)," and then some stufff")


-- change the output of an existing parser
mapParser :: Parser a -> (a->b) -> Parser b
mapParser pa f input = case pa input of
                   Nothing         -> Nothing
                   Just (a, rest)  -> Just (f a, rest)


-- think, could Parsers be functors?  Do they obay the functor laws?  Do they fit any other abstractions?


-- a bugggy implementation for demo perposes
numDigits:: Integer -> Integer
numDigits n = if n <= 9
              then 1
              else (numDigits (n `quot` 10)) + 1

numDigitsExample1 = (numDigits 999) == 3

numDigitsExample2 = (numDigits 1000) == 4

floatParser = mapParser (intParser +++ (literal ".") +++ (intParserHelper 0)) (\ ((whole, _), fract) -> (fromIntegral whole) + (fromIntegral fract)/(10 ^^ (numDigits fract) ))

-- *MyParserLib> floatParser "1234.5678 and then some stufff"
-- Just (1234.5678," and then some stufff")
-- *MyParserLib> floatParser "1234 and then some stufff"
-- Nothing


-- see https://hackage.haskell.org/package/base-4.11.1.0/docs/Data-Either.html

--try to parse a, if that doesn't work try to pars b
(<|>) :: Parser a -> Parser b -> Parser (Either a b)
(pa <|> pb) str = case (pa str) of
                    Just (a, rest) -> Just (Left a, rest)
                    Nothing        -> case (pb str) of
                                        Nothing       -> Nothing
                                        Just (b,rest) -> Just (Right b,rest)


floatOrInt  = floatParser <|> intParser

--    *MyParserLib> floatOrInt "1000 and stuff"
--    Just (Right 1000," and stuff")
--    *MyParserLib> floatOrInt "1000.00001 and stuff"
--    Just (Left 1000.1," and stuff")
-- note there is a bug in floatParser


-- take a parser and parse as much as possible into a list
rep :: Parser a -> Parser ([a])
rep pa str = case (pa str) of
               Nothing        -> Just ([], str)
               Just (a, rest) -> (mapParser (rep pa) (\ ls -> a:ls)) rest

numbers = rep (floatOrInt +++ literal ",")

--parse spaces, throw them away
spaces :: Parser ()
spaces = (rep ((literal " ") <|> (literal ['\t']))) `mapParser` (\ _ -> ())

-- eat the spaces before a parser
eatS :: Parser a -> Parser a
eatS pa = spaces +++ pa `mapParser` \ (_,a) -> a

numbers' = rep (eatS floatOrInt +++ literal ",")

--    *MyParserLib> eatSpaces "       and stuf"
--    Just ((),"and stuf")

--these will become helpful for parsing Lang 3 and 4

-- parse a single letter
letterParser :: Parser Char
letterParser "" = Nothing
letterParser (head:tail) = if isAlpha head
                           then Just (head, tail)
                           else Nothing


-- parse what we will consider a good variable name (for now)
varParser :: Parser String
varParser = (letterParser +++ rep letterParser ) `mapParser` (\ (h, tail) -> h:tail)
