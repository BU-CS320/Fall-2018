module EvalUnsafeTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck
import Test.QuickCheck.Function

import EnvUnsafe

instance (Arbitrary a) => Arbitrary (Unsafe a) where
  arbitrary = do a <- arbitrary
                 s <- arbitrary
                 elements [Error s, Ok a]

-- but this isn't great because we can't show the test failure
instance (CoArbitrary e,  Arbitrary a) => Arbitrary (EnvUnsafe e a) where
  arbitrary = do fun <- arbitrary
                 return $ EnvUnsafe fun


-- one way to avoid this is by reasoning about the types. Here the thought is: e can't be used in the fmap definition so make it the simplest type possible since it doesn't matter
weakIdFunctorLaw :: Eq a => (Unsafe a)  -> Bool
weakIdFunctorLaw unsafe   =  let unsafeEnv = EnvUnsafe $ \ () -> unsafe
                             in r (fmap id unsafeEnv) () == r unsafeEnv ()


-- another way to test make an entire other type that is showable (Note it is annoyingly not in lambda form)
type EnvUnsafeTestable e a = (Fun e (Unsafe a))

toEnvUnsafe fn = EnvUnsafe $ apply fn

-- fmap id = id
idFunctorLaw :: Eq a => (EnvUnsafe e a) -> e -> Bool
idFunctorLaw unsafeEnv e =  r (fmap id unsafeEnv) e == r unsafeEnv e

-- fmap (g . h) = (fmap g) . (fmap h)
compFunctorLaw :: Eq c =>   (a-> b) -> (b-> c) -> (EnvUnsafe e a) -> e -> Bool
compFunctorLaw  h g unsafeEnv e =  r (fmap (g . h) unsafeEnv) e == r ((fmap g) . (fmap h) $ unsafeEnv) e

-- return a >>= k  =  k a
leftIdMonadLaw ::  Eq b =>  a -> (a -> EnvUnsafe e b) -> e -> Bool
leftIdMonadLaw a k e = r ((return a) >>= k) e  ==  r (k a) e

--TODO:
-- m >>= return    =  m
-- m >>= (\x -> k x >>= h)  =  (m >>= k) >>= h


unitTests =
  testGroup
    "EvalUnsafeTest"
    [instructorTests
     -- TODO: your tests here!!!
    ]

instructorTests = testGroup
      "instructorTests"
      [
      testProperty "functor id law holds" $ (  (\e -> idFunctorLaw $ toEnvUnsafe e)::  (EnvUnsafeTestable Bool (Unsafe Integer) ) -> Bool -> Bool),
      testProperty "functor id law holds" $ (weakIdFunctorLaw ::  (Unsafe Integer) -> Bool),
      testProperty "functor composition law holds" $ (  (\h g e -> compFunctorLaw (apply h) (apply g) (toEnvUnsafe e))::  (Fun Char Integer) -> (Fun Integer String) -> (EnvUnsafeTestable Bool Char ) -> Bool -> Bool),

      testProperty "left monad identity law holds" $ (  (\ a k -> leftIdMonadLaw a $ toEnvUnsafe . (apply k) ) ::  Integer -> (Fun Integer  (EnvUnsafeTestable Bool Char )) -> Bool -> Bool)
      ]

-- TODO: your tests here!!!
-- TODO: test the other type class Laws
-- TODO: some concrete example test cases