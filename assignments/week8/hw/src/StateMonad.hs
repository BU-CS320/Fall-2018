module StateMonad where
import Control.Monad(ap)

-- notice how we handled state in https://github.com/BU-CS320/Fall-2018/blob/master/assignments/week7/hw/src/week5/Lang4.hs
-- we can make a monadic type to handle the details for us
data Stateful s a  = Stateful (s ->(a,s))

-- a helper function to pull out the function bit
app :: Stateful s a -> (s ->(a,s))
app (Stateful stateful) = stateful

instance Functor (Stateful s) where
  -- fmap :: (a -> b) -> State a -> State b
  fmap f (Stateful sa) =  Stateful $ \ state -> case sa state of
                                                  (a, output) -> (f a, output)

--ignore this for now
instance Applicative (Stateful s) where
  pure = return
  (<*>) = ap

instance Monad (Stateful s) where
  --return :: a -> State a
  return a = Stateful $  \ state -> (a, state)

  --(>>=) :: State a -> (a -> State b) -> State b
  (Stateful sa) >>= f = Stateful $  \ state -> case sa state of
                                                 (a, output) -> app (f a) output


-- a function that gets the state (in a stateful way)
-- stolen from https://wiki.haskell.org/State_Monad
get :: Stateful s s
get = Stateful $ \ s ->  (s,s)