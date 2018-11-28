module TypeProblems where


data Answer a = Impossible | Example a


-- Give Example definitions that have the following types if it is possible, If not return "Impossible".  It does not matter what the definitions actually do as long AS they are correctly typed, they do not "loop forever", and they do not use undefined.

q1 :: Answer [Bool]
q1 = undefined

q2 :: Answer ([(Int,Char)],Bool)
q2 = undefined

q3 :: Answer (Int -> Bool -> Char -> Int -> Bool)
q3 = undefined

q4 :: Answer (a -> ([a],[a],[a]))
q4 = undefined


q5 :: Answer (a -> b)
q5 = undefined

q6 :: Answer (a -> a)
q6 = undefined

-- but different then above
q7 :: Answer (a -> a)
q7 = undefined

q8 :: Answer (a -> a -> a)
q8 = undefined

-- but different then above
q9 :: Answer (a -> a -> a)
q9 = undefined


q10 :: Answer (a -> b -> a)
q10 = undefined

q11 :: Answer (a -> b -> b)
q11 = undefined

q12 :: Answer ((a -> b) -> b)
q12 = undefined

q13 :: Answer ((a -> b) -> (Maybe b))
q13 = undefined

q14 :: Answer (a -> b -> (b,a))
q14 = undefined

q15 :: Answer ((a -> b) -> (b -> c) -> (a -> c))
q15 = undefined

q16 :: Answer ((a -> b) -> (b -> c) -> (c -> a))
q16 = undefined

q17 :: Answer ((a -> b) -> ([b] -> c) -> c)
q17 = undefined
