module IndexAndConcordanceTest where 

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import IndexAndConcordance(cleanup,createWordLists,makePairs, addPageNumber, createWordList, insertAll, makeConcordance)


unitTests =
  testGroup
    "IndexAndConcordanceTest"
    [testingAddPageNum]
    
    
    str = ["hi","there","this","is","a", "test", "CASE"]
    answer = [(1,"hi"),(1,"there"),(1,"this"),(1,"is"),(1,"a"),(1,"test"),(1,"CASE")]
    
    testingAddPageNum = testCase "should return: [(1,"hi"),(1,"there"),(1,"this"),(1,"is"),(1,"a"),(1,"test"),(1,"CASE")]" $ assertEqual [] answer (addPageNumber (1,str))
