module IndexAndConcordanceTest where 

import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)

import IndexAndConcordance(cleanup,createWordLists,makePairs, addPageNumber, createWordList, insertAll, makeConcordance)


unitTests =
  testGroup
    "IndexAndConcordanceTest"
    [cleanUpTest --,createWordListsTest
	]

str1 = "Hey there student, I hope your test case did not FAIL. LOSER."
str1Ans = "hey there student  i hope your test case did not fail  loser "

str2 = "Okay, this is string 2, it's not really very useful but it does the JOB."

strList = [str1, str2]
createWordListsAnswer = [["hey","there","student","i","hope","your","test","case","did","not","fail","loser"],["okay","this","is","string","2","it's","not","really","very","useful","but","it","does","the","job"]]


cleanUpTest = 
	testCase "should return: hey there student  i hope your test case did not fail  loser "  $ assertEqual [] (str1Ans) (cleanup str1)

--createWordListsTest = 
--	testCase "output is incorrect, please check test file for answer" $ assertEqual (createWordListsAnswer) (createWordLists strList)



