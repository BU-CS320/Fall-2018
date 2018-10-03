# HW Due 10/9
Lab and HW are combined this week.

## Setup
Before you begin run: ```cabal install tasty-quickcheck``` (or ```sudo cabal install tasty-quickcheck``` on mac)

Similar to [lab2](../../week2/lab2)
1. Follow this [link](https://classroom.github.com/a/89uRuGVq) to create an assignment repository
1. Clone your personal assignment repo
1. set the public upstream repo with ```git remote add upstream https://github.com/BU-CS320/Fall-2018.git```
1. ```cd```  into this assignment (```cd assignments/week5/hw```), first we will write a greeting
   1. run ```cabal new-repl``` (or ```cabal repl``` if gets "Failed to load interface") in the terminal (it is important that you do this in the ```hw``` directory).
   1. in your favorite text editor open ```src/WarmUp.hs``` and answer the questions

## Submit
similar to [lab2](../../week2/lab2)
1. run the tests by running ```cabal test```
1. run ```git status``` to make sure everything is ok
1. run ```git commit -a -m "done with another HW!"``` to make a commit on your laptop
1. run ```git push``` to submit your work
1. check that you can see your solutions on the website for your private repo

## REPL commands
 * ```:load x``` will load a different module
 * ```:reload``` reloads the module
 * ```:type x``` tells you the type of x
 * ```:q``` quits out of the REPL


## Hints
 * start early and submit tests
 * refresh the cabal REPL constantly!
 * commit and push to your private repo often
 * check your github private repo that you work has been submitted
 * it is best to pull in form the upstream after you have committed and pushed to your private repo.

## Notes

   


