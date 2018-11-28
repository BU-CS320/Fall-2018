# HW Due 11/29

## Before
Watch the short [video](https://youtu.be/QUBUPId5WRQ) that walks through this HW.

## Setup
Similar to [lab2](../../week2/lab2), Follow this [link](https://classroom.github.com/a/IbYXBcl2) to create an assignment repository

This week we will write our largest language so far.  It is a functional language that has Bools, Integers, and Lists.
* You will need to write the monadic plumbing in EnvUnsafe.hs
* You will need to write an evaluation function in Lang.hs
* you will need to write a parser in LangParser.hs

Before you begin anything experiment with the Ast we have given you ```:load Lang``` and try 5-10 different ASTs so you get a sense of how the language "looks",
The show instance is hooked up to a pretty printer we provide that matches the exact syntax that you will eventually parse.

for example (you will not be able to run them yet but you should think about what the answer is):
```
*Lang> Plus (ValInt 2) (ValInt 3)
2 + 3
*Lang> run $ Plus (ValInt 2) (ValInt 3)
Ok (I 5)
*Lang> And (ValBool True) (ValBool False)
true && false
*Lang> run $ And (ValBool True) (ValBool False)
Ok (B false)
*Lang> And (ValBool True) (ValInt 3)
true && 3
*Lang> run $ And (ValBool True) (ValInt 3)
Error "expected a bool but found an Int!"
*Lang> ((Lam "x" (Lam "y" ( (Var "x") `Plus` (Var "y")))) `App` (ValInt 7)) `App` (ValInt 4)
(\ x -> \ y -> x + y) 7 4
*Lang> run $ ((Lam "x" (Lam "y" ( (Var "x") `Plus` (Var "y")))) `App` (ValInt 7)) `App` (ValInt 4)
Ok (I 11)
```

you can choose your own error messages as long as they are reasonable.


## Submit
similar to [lab2](../../week2/lab2)

## Hints
 * use do notation!
 * parse smaller things, test and then parse bigger things with the smaller things
 * start early and submit tests
 * refresh the cabal REPL constantly!
 * commit and push to your private repo often
 * check your github private repo that you work has been submitted
 * it is best to pull in form the upstream after you have committed and pushed to your private repo.

## Notes
added a video and some tests.
But you will be graded on at least some hidden tests, so please test thoroughly.


## REPL commands
 * ```:load x``` will load a different module
 * ```:reload``` reloads the module
 * ```:type x``` tells you the type of x
 * ```:q``` quits out of the REPL

