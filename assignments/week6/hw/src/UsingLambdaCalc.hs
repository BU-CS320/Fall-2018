module UsingLambdaCalc  where
import Prelude (undefined,Show) -- DO NOT CHANGE THIS LINE

-- TODO fix boilerplate

-- λ-calculus
--
-- For these problems you will only be allowed to use lambda expressions.  Nothing else is allowed.
--

-- Lambda Calculus in Haskell
--
-- The λ-calculus is a fundamental notion in computer science and has become part of the culture of programming languages, so much so that many languages, including Java, Python and Haskell, include lambda expressions in their syntax.
--
--
-- For instance, the lambda expression
--
-- λx. λy. (x y)
--
-- can be written in Haskell as
--
-- \ x -> \ y -> x y
--
-- because Haskell only allows well typed functions some lambda expressions cannot be written
--
--  λx. (x x)
--
-- non of the examples in this assignment require that

-- Lets explore the λ-calculus in Haskell by exploring how some primitive ideas, such as boolean values, conditions, and integers can be encoded as λ-expressions.

-- ##  Booleans
--
-- The basic values in Boolean logic are the constants True and False. These can be encoded as λ-expressions as follows

true = \ x -> \ y -> x
false = \ x -> \ y -> y

-- Notice that true takes two arguments and returns the first of them; false takes two arguments and returns the second of them:

-- true "then" "else"
--
-- false "then" "else"
--



-- Now we consider how to define the standard Boolean operators. The not operator must be a λ-expression such that
--
--             not(true) --> false
--
-- and
--
--             not(false) --> true
--
-- where --> indicates beta-conversion as discussed in lecture.
--
-- Here is the way to do it:

not bool = bool false true


-- Your turn!  Try to implement the Boolean operator for and.

and = undefined



-- Now implement the or operator:

or = undefined



-- Implement an "xor"


xor = undefined




--
-- ##  Natural Numbers
--
-- Another common construct is a number.  The number n can be represented by the n-fold application of a function to an argument. For instance we can represent 2 as

two = \ f -> \ start -> f (f start)


-- Try to implement the following numbers

zero = undefined
one = undefined

three = undefined



-- Implement the number 7:

seven = undefined


-- Now, how would we represent addition? To represent n+m, we would have to compose an n-fold application with an m-fold application:

add = undefined


-- Now implement the multiplication function

mult = undefined


-- Finally, implement a function that tests if a number is even

isEven = undefined



-- ##  Bonus:  Recursion (ungraded)

-- One important aspect of the lambda calculus is the ability to perform arbitrary recursion. It is not obvious from our definition of lambda calculus that this is possible. Try to figure out a scheme to do this.  You will need to do this work by hand since Haskell’s type system will not allow it.
--
-- Try to use recursion to write a factorial function.