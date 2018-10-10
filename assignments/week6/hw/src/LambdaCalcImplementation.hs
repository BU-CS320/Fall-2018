module LambdaCalcImplementation where
import Data.Map -- for Env
import Data.Set

data LambdaExpression = App LambdaExpression LambdaExpression | Lam String LambdaExpression | Identifier String

type Env = Map String LambdaExpression

-- when is there no evaluation that can be done on a lambda expression?
isValue :: LambdaExpression -> Bool
isValue = undefined


-- collect all the vars that appear in the expression that are not bound
freeVars :: LambdaExpression -> Set String
freeVars = undefined

boundVars :: LambdaExpression -> Set String
boundVars (Lam v bod) = Data.Set.insert v $ boundVars bod
boundVars (Identifier _) = Data.Set.empty
boundVars (App f a) = boundVars f `Data.Set.union` boundVars a

-- find a name that doesn't conflict with the other bindings, or the environment
findName :: Env -> LambdaExpression -> String -> String
findName env exp str | Data.Set.member str $ boundVars exp = findName env exp $ str ++ "'"
                     | Data.Map.member str env             = findName env exp $ str ++ "'"
                     | otherwise                           =  str


-- rename a free var so it doesn't conflict with the other bindings, or the environment
rename :: LambdaExpression -> String -> String -> LambdaExpression
rename (App f a)      from to             = App (rename f from to) (rename a from to)
rename (Lam v bod)    from to | v == from = Lam v bod
                              | otherwise = Lam v $ rename bod from to
rename (Identifier v) from to | v == from = (Identifier to)
                              | otherwise = Identifier v


-- the last three functions are just to avoid the annoying case of
-- \ x . ( ( \y . \ x . y ) ) x)
--capture = Lam "x" $ App (Lam "y" $ Lam "x" $ Identifier "y") $ Identifier "x"


-- do all possible applications, rename bound variables as needed
eval :: Env ->  LambdaExpression -> LambdaExpression
eval = undefined




instance Show Ast where
  show _ = undefined

-- equality on eval result, where the names of bindings don't matter
-- this is called alpha-beta-equality
instance Eq Ast where
  _ == _ = undefined

