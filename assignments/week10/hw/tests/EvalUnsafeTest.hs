module EvalUnsafeTest where

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Test.Tasty.QuickCheck


import EnvUnsafe

instance (Arbitrary a) => Arbitrary (Unsafe a) where
  arbitrary = do a <- arbitrary
                 s <- arbitrary
                 elements [Error s, Ok a]


instance (CoArbitrary e,  Arbitrary a) => Arbitrary (EnvUnsafe e a) where
  arbitrary = do fun <- arbitrary
                 return $ EnvUnsafe fun


idFunctorLaw :: Eq a => (EnvUnsafe e a) -> e -> Bool
idFunctorLaw unsafeEnv e =  r (fmap id unsafeEnv) e == r unsafeEnv e

-- this one is easier to show
weakIdFunctorLaw :: Eq a => (Unsafe a)  -> Bool
weakIdFunctorLaw unsafe   =  let unsafeEnv = EnvUnsafe $ \ () -> unsafe
                             in r (fmap id unsafeEnv) () == r unsafeEnv ()




unitTests =
  testGroup
    "EvalUnsafeTest"
    [instructorTests
     -- TODO: your tests here!!!
	 ]

instructorTests = testGroup
      "instructorTests"
      [
      testProperty "functor id law holds" $ (weakIdFunctorLaw ::  (Unsafe Integer) -> Bool)
      ]

-- TODO: your tests here!!!
-- TODO: test the other type class Laws
-- TODO: some concrete example test cases