module ExceptionMonad where
import Control.Monad(ap)

data Unsafe a = Error String | Ok a deriving (Show, Eq)

instance Functor Unsafe where
  -- fmap :: (a -> b) -> Unsafe a -> Unsafe b
  fmap f _ =  undefined
  -- hint: f :: a -> b

--ignore this for now
instance Applicative Unsafe where
  pure = return
  (<*>) = ap

instance Monad Unsafe where
  --return :: a -> Unsafe a
  return = undefined

  --(>>=) :: Unsafe a -> (a -> Unsafe b) -> Unsafe b
  _ >>= f  =  undefined
  -- hint: f :: a -> Unsafe b
