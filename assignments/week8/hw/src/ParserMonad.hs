module ParserMonad where
import Control.Monad       (liftM, ap)

data Parser a = Parser (String -> Maybe (a, String))

parse :: Parser a -> (String -> Maybe (a, String))
parse (Parser f) = f

-- a parser that always fails (empty in the book)
failParse :: Parser a
failParse = Parser $ \ input -> Nothing

instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap f (Parser pa) =  undefined

--ignore this for now
instance Applicative Parser where
  pure = return
  (<*>) = ap

instance Monad Parser where
  --return :: a -> Parser a
  return a =  undefined

  --(>>=) :: Parser a -> (a -> Parser b) -> Parser b
  (Parser pa) >>= f  = undefined




(+++) :: Parser a -> Parser b -> Parser (a,b)
pa +++ pb =  undefined

-- read in a char (from book)
item :: Parser Char
item = Parser $ \ input -> case input of ""    -> Nothing
                                         (h:t) -> Just (h, t)


-- read in a char if it passes a test, (from book)
sat :: (Char -> Bool) -> Parser Char
sat p = do c <- item
           if p c
           then return c
           else failParse


literal :: String -> Parser String
literal  =  undefined

exampleParser' = do literal "Let"
                    name <- literal "x" -- in real life this would be a var parser
                    literal "="
                    nat <- literal "2" -- in real life this would be an Ast parser
                    literal "in"
                    body <- literal "3" --in real life this would be an Ast parser
                    return (name, nat, body) -- in real life this would call the right constructor

-- *ParserMonad> parse exampleParser' "Letx=2in3"
-- Just (("x","2","3"),"")


-- parse natural numbers, like "123", or "000230000"
natParser :: Parser Integer
natParser =  undefined


--try to parse a, if that doesn't work try to pars b
(<|>) :: Parser a -> Parser b -> Parser (Either a b)
(<|>)  =  undefined


rep :: Parser a -> Parser ([a])
rep =  undefined

spaces :: Parser ()
spaces =  undefined

-- a nicer version of eat spaces, eat the spaces before or after the parser (from book)
token:: Parser a -> Parser a
token pa = undefined


varParser :: Parser String
varParser =  undefined

exampleParser = do token $ literal "Let"
                   name <- varParser
                   token $ literal "="
                   nat <- natParser --in real life this would be an Ast parser
                   token $ literal "in"
                   body <- natParser --in real life this would be an Ast parser
                   return (name, nat, body) -- in real life this would call the right constructor