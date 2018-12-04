module StatefulUnsafeMonad where
import Control.Monad(ap)


data Unsafe a = Error String | Ok a deriving (Show, Eq)

-- notice how we handled state in https://github.com/BU-CS320/Fall-2018/blob/master/assignments/week7/hw/src/week5/Lang4.hs
-- we can make a monadic type to handle the details for us
data StatefulUnsafe s a  = StatefulUnsafe (s -> (Unsafe a,s))

-- a helper function to pull out the function bit
app :: StatefulUnsafe s a -> (s ->(Unsafe a,s))
app (StatefulUnsafe stateful) = stateful


-- a way to easily return an error (for instance in do notation)
err :: String -> StatefulUnsafe e a
err s = StatefulUnsafe $ \ state -> (Error s, state)

instance Functor (StatefulUnsafe s) where
  -- fmap :: (a -> b) -> Stateful a -> Stateful b
  fmap f (StatefulUnsafe sa) =  StatefulUnsafe $ \ state -> case sa state of
                                                              (Ok a, output) -> (Ok $f a, output)
                                                              (Error e, output) -> (Error e, output)

--ignore this for now
instance Applicative (StatefulUnsafe s) where
  pure = return
  (<*>) = ap

instance Monad (StatefulUnsafe s) where
  --return :: a -> StatefulUnsafe s a
  return a = StatefulUnsafe $ \ state -> (Ok a, state)

  --(>>=) :: StatefulUnsafe s a -> (a -> StatefulUnsafe s b) -> StatefulUnsafe s b
  (StatefulUnsafe sa) >>= f = StatefulUnsafe $ \ state -> case sa state of
                                                           (Ok a, output) -> app (f a) output
                                                           (Error e, output) -> (Error e, output)


-- a function that gets the state (in a stateful way)
-- stolen from https://wiki.haskell.org/State_Monad
get :: StatefulUnsafe s s
get = StatefulUnsafe $ \ s ->  (Ok s,s)

put :: s -> StatefulUnsafe s ()
put s = StatefulUnsafe $ \ _ ->  (Ok (),s)


unsafeReturn :: Unsafe a -> StatefulUnsafe s a
unsafeReturn ua = StatefulUnsafe $ \ state -> (ua, state)