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

-- all the vars appearing in the expression
vars :: LambdaExpression -> Set String
vars exp = freeVars exp `Data.Set.union` boundVars exp

-- find a new name that doesn't conflict with a set of other names
findName :: Set String -> String -> String
findName avoidNames str | Data.Set.member str avoidNames = findName avoidNames $ str ++ "'"
                        | otherwise                      = str

-- get all the vars in the environment
envVars :: Env -> Set String
envVars = Data.Map.foldr (\ v  temp ->  (vars v) `Data.Set.union` temp ) Data.Set.empty

-- choose a good name given an environment
goodName :: Env ->  LambdaExpression -> String -> String
goodName env exp s =  findName (boundVars exp `Data.Set.union` keysSet env  `Data.Set.union` envVars env) s

-- rename a free var so it doesn't conflict with the other bindings, or the environment
rename :: LambdaExpression -> String -> String -> LambdaExpression
rename (App f a)      from to             = App (rename f from to) (rename a from to)
rename (Lam v bod)    from to | v == from = Lam v bod
                              | otherwise = Lam v $ rename bod from to
rename (Identifier v) from to | v == from = (Identifier to)
                              | otherwise = Identifier v


-- the last six functions are just to avoid the annoying case of
-- λ x . ( ( λ y . λ x . y ) ) x) 

-- do all possible applications, rename bound variables as needed
eval :: Env ->  LambdaExpression -> LambdaExpression
eval = undefined



-- show the unevaluated expression, in a human readable way.  See the tests for some examples.
instance Show LambdaExpression where
  show _ = undefined

-- equality on the structure of the term, where the names of bindings don't matter.  Don't evaluate first.
-- this is called alpha-equality
instance Eq LambdaExpression where
  _ == _ = undefined

