module StateMonad where
import Control.Monad       (liftM, ap)

data Stateful s a  = Stateful (s ->(a,s))

app :: Stateful s a -> (s ->(a,s))
app (Stateful stateful) = stateful

instance Functor (Stateful s) where
  -- fmap :: (a -> b) -> State a -> State b
  fmap f (Stateful sa) =  undefined

--ignore this for now
instance Applicative (Stateful s) where
  pure = return
  (<*>) = ap

instance Monad (Stateful s) where
  --return :: a -> State a
  return a = undefined

  --(>>=) :: State a -> (a -> State b) -> State b
  (Stateful sa) >>= f  = undefined


-- stolen from https://wiki.haskell.org/State_Monad

get :: Stateful s s
get = Stateful $ \ s ->  (s,s)