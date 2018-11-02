module Lang1Parser where

import Lang1 hiding (test1, test2)
import MyParserLib


-- It is recommended you use the following helper functions

-- parseAstInt :: Parser Ast
-- parseAstInt = eatS intParser
--                 `mapParser` (\ i -> AstInt i)
--
-- pluses :: Parser [Ast]
-- pluses = (rep ( eatS ((literal "+") +++ parseIntOrParens)
--             `mapParser` \ (_, ast) -> ast) )
--
-- parseAstInt :: Parser Ast
-- parseAstInt = eatS intParser
--                 `mapParser` (\ i -> AstInt i)
--
-- seperators :: Parser [Ast]
-- seperators = undefined
--
-- parseParens :: Parser Ast
-- parseParens = eatS (literal "(") +++ parser +++ eatS (literal ")")
--                 `mapParser` \ ((_, ast), _) -> ast
--
-- parseIntOrParens  :: Parser Ast
-- parseIntOrParens = parseAstInt <|> parseParens
--                      `mapParser` \ ast -> case ast of
--                                             Left a  -> a
--                                             Right a -> a
--
-- plusExpParser :: Parser Ast
-- plusExpParser =  parseIntOrParens +++ pluses `mapParser` combinePlus
--
-- -- could be a fold
-- combinePlus :: (Ast, [Ast]) -> Ast
-- combinePlus (a, []) = a
-- combinePlus (a, (h:t)) =  a `Plus` (combinePlus (h, t))


parser :: Parser Ast
parser = undefined -- plusExpParser +++ seperators `mapParser` undefined


unsafeParser :: String -> Ast
unsafeParser input = case ((parser +++ spaces) `mapParser`  \ (ast, _) -> ast) input of
                            Just (ast,"")  -> ast
                            _              -> error "you made a typo"
