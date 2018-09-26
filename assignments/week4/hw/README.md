# HW Due 10/2
Lab and HW are combined this week.

## Setup
similar to [lab2](../../week2/lab2)
1. Follow this [link](https://classroom.github.com/a/0AhHIoTK) to create an assignment repository
1. Clone your personal assignment repo with the command line ```git clone https://github.com/BU-CS320/week2-username.git``` with ```username``` replaced with your user name
1. ```cd``` into the newly created directory
1. set the public upstream repo with ```git remote add upstream https://github.com/BU-CS320/Fall-2018.git```
1. ```cd```  into this assignment (```cd assignments/week4/hw```), first we will write a greeting
   1. run ```cabal new-repl``` (or ```cabal repl``` if gets "Failed to load interface") in the terminal (it is important that you do this in the ```hw``` directory).
   1. in your favorite text editor open ```src/WarmUp.hs``` and answer the questions

## Submit
similar to [lab2](../../week2/lab2)
1. run the tests by running ```cabal test``` (this step is less important for this lab since many of the answers are open ended)
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
Annoying List was too hard so I added a way to put elements at the front of the list (cons).
### 9:05 Lab
There were a couple of mistakes that I have now corrected.
### 3:35 Lab
A student asked why we couldn't make an instance of the insult typeclass for `String` this [stackoverflow post](https://stackoverflow.com/questions/5941701/why-can-i-not-make-string-an-instance-of-a-typeclass) has a very good answer 

   
## Sharing Tests, and correcting my spelling
We will allow you to share tests with the class. To do this 
 * Make a fork of the class repo: https://github.com/BU-CS320/Fall-2018
 * clone your fork locally (keep it separate from your assignment clone)
 * go to the test directory (in this case Fall-2018/assignments/week2/lab2/tests)
 * add a test
 * push the test up to your fork
 * https://help.github.com/articles/creating-a-pull-request/
 * If your test looks good we will accept it

