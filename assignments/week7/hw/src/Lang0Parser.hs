module Lang0Parser where

import Lang0 hiding (test1)
import MyParserLib


parseAstInt :: Parser Ast
parseAstInt = eatS intParser
                `mapParser` (\ i -> AstInt i)


pluses :: Parser [Ast]
pluses = (rep ( eatS ((literal "+") +++ parseIntOrParens)
            `mapParser` \ (_, ast) -> ast) )


parseParens :: Parser Ast
parseParens = eatS (literal "(") +++ parser +++ eatS (literal ")")
                `mapParser` \ ((_, ast), _) -> ast

parseIntOrParens  :: Parser Ast
parseIntOrParens = parseAstInt <|> parseParens
                     `mapParser` \ ast -> case ast of
                                            Left a  -> a
                                            Right a -> a

parser :: Parser Ast
parser =  parseIntOrParens +++ pluses `mapParser` combinePlus

-- could be a fold
combinePlus :: (Ast, [Ast]) -> Ast
combinePlus (a, []) = a
combinePlus (a, (h:t)) =  a `Plus` (combinePlus (h, t))


unsafeParser :: String -> Ast
unsafeParser input = case ((parser +++ spaces) `mapParser`  \ (ast, _) -> ast) input of
                            Just (ast,"")  -> ast
                            _              -> error "you made a typo"

