module Lang4Parser where

import Data.Char
import Data.Map(Map, lookup, insert, empty, fromList)  -- for State in tests

import Lang4 hiding (test1, test2)
import MyParserLib



-- It is recommended you use the following helper functions

-- idParser :: Parser Ast
-- idParser = eatS varParser `mapParser` \ str -> Id str
--
-- parseAstInt :: Parser Ast
-- parseAstInt = eatS intParser
--                 `mapParser` (\ i -> AstInt i)
--
-- letParser :: Parser Ast
-- letParser = undefined
--
-- pluses :: Parser [Ast]
-- pluses  = undefined
--
--
-- seperators :: Parser [Ast]
-- seperators  = undefined
--
-- parseParens :: Parser Ast
-- parseParens  = undefined
--
-- parseIntOrParensOrEq :: Parser Ast
-- parseIntOrParensOrEq  = undefined
--
-- plusExpParser :: Parser Ast
-- plusExpParser  = undefined


parser :: Parser Ast
parser  = undefined


unsafeParser :: String -> Ast
unsafeParser input = case ((parser +++ spaces) `mapParser`  \ (ast, _) -> ast) input of
                            Just (ast,"")  -> ast
                            _              -> error "you made a typo"

