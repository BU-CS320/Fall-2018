module IndexAndConcordanceTest where 

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import IndexAndConcordance(cleanup,createWordLists,makePairs, addPageNumber, createWordList, insertAll, makeConcordance)


unitTests =
  testGroup
    "IndexAndConcordanceTest"
    []
