module ExceptionMonad where
import Control.Monad(ap)

data Unsafe a = Error String | Ok a deriving (Show, Eq)

instance Functor Unsafe where
  -- fmap :: (a -> b) -> Unsafe a -> Unsafe b
  fmap f _ =  undefined

--ignore this for now
instance Applicative Unsafe where
  pure = return
  (<*>) = ap

instance Monad Unsafe where
  --return :: a -> Unsafe a
  return = undefined

  --(>>=) :: Unsafe a -> (a -> Unsafe b) -> Unsafe b
  _ >>= f  =  undefined



-- listProb:
-- Step 0: number = 1, result = 0
-- Step 1: look up the number in the list, if the number is 0 return the result
-- Step 2: if the number is not 0 add it to the result and return to Step 1 with the number
-- if anything doesn't return a number return a human readable error message
listProb :: [Unsafe Integer] -> Unsafe  Integer
listProb = undefined

-- some helper functions you might use

-- get :: Integer -> [Unsafe Integer] -> Unsafe  Integer
-- get = undefined
--
-- listProbHelper :: [Unsafe Integer] -> Integer -> Integer -> Unsafe  Integer
-- listProbHelper  = undefined
