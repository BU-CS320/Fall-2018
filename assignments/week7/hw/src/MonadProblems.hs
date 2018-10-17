module MonadProblems where

-- type classes have some rules, Haskell people call these rules "Laws"

-- monads have the rules
-- left identity,  return a >>= k  =  k a
-- right identity,  m >>= return    =  m
-- associativity,  m >>= (\x -> k x >>= h)  =  (m >>= k) >>= h
-- (copied from https://wiki.haskell.org/Typeclassopedia#Monad)

-- let's break some laws


-- let's break the left identity

data NotLI a = Undefined deriving (Show, Eq) -- replace Undefined with your constructors
-- note Eq must be defined correctly over NotLI, "deriving Eq" will do this for you


-- you may ignore these 2 instances, just here to make Haskell happy
instance Functor NotLI where
  fmap f ma =  ma >>= (\x -> return $ f x)

instance Applicative NotLI where
  pure  = return
  mf <*> y = mf >>= (\f -> fmap f y)

instance Monad NotLI where
  --return :: a -> NotLI a
  return _ = undefined

  --(>>=) :: NotLI a -> (a -> NotLI b) -> NotLI b
  _ >>= _  =  undefined


-- give an examples that show the identity law being broken  "(return aNum >>= aFunc) /=  (aFunc aNum)"

aNum :: Integer
aNum = undefined

aFunc :: Integer -> NotLI String
aFunc _ = undefined


-- let's break the associativity law
data NotAs a = Undefined2 deriving (Show, Eq) -- replace Undefined2 with your constructors
-- note Eq must be defined correctly over NotLI, "deriving Eq" will do this for you


-- you may ignore these 2 instances, just here to make Haskell happy
instance Functor NotAs where
  fmap f ma =  ma >>= (\x -> return $ f x)

instance Applicative NotAs where
  pure  = return
  mf <*> y = mf >>= (\f -> fmap f y)

instance Monad NotAs where
  --return :: a -> NotAs a
  return _ = undefined

  --(>>=) :: NotAs a -> (a -> NotAs b) -> NotAs b
  _ >>= _  =  undefined

-- give an examples that show the identity law being broken  "(mNum >>= (\x -> kFun x >>= hFun)) /=  ((mNum >>= kFun) >>= hFun)"


mNum :: NotAs Integer
mNum = undefined

kFun :: Integer -> NotAs String
kFun = undefined

hFun :: String -> NotAs Bool
hFun = undefined





-- Hints: don't read if you want to spoil the fun




-- NotLI: you can make a bad maybe
-- NotAs can be done with 2 constructors and a "case _ of" in the definition of >>=
-- the functions mostly don't matter