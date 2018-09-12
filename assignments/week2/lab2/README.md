# Lab 2

## Before

Review the [video](https://www.youtube.com/watch?v=fXbWsMHKI5A) that was posted 9/11.

## Setup (similar to [lab1](../../week1/lab1))
1. Follow this [link](https://classroom.github.com/a/S9FoucLq) to create an assignment repository
   1. Press the "Accept this assignment" button, this will create a private repository for your solutions
   1. When the cloning finishes, you will see a link like "Your assignment has been created here: [link to your new private repo]", click that link.  You will know you are looking at your private repo becuase you will see ![Lock icon BU-CS320/weel1- your user name Private](img/private-repo.png) on the top of the web page.
1. Clone your personal assignment repo with the command line ```git clone https://github.com/BU-CS320/week2-username.git``` with ```username``` replaced with your user name
1. ```cd``` into the newly created directory by typing ```cd week2-username``` with ```username``` replaced with your user name
1. You always want to take advantage of the latest corrections to the assignments and shared tests so we will add the main repository as a remote source
   1. In your terminal type ```git remote add upstream https://github.com/BU-CS320/Fall-2018.git```
   1. check that it worked by typing ```git remote -v```.  You should see see the line ```upstream https://github.com/BU-CS320/Fall-2018.git (fetch)```
   1. You always want to keep your assignment up to date by running ```git pull upstream master```, do that now
1. ```cd```  into this assignment (```cd assignments/week2/lab2```), first we will write a greeting
   1. run ```cabal new-repl``` (or ```cabal repl``` if gets "Failed to load interface") in the terminal (it is important that you do this in the ```lab2``` directory).
   1. in your favorite text editor open ```src/Data.hs``` and answer the questions

## Submit (similar to [lab1](../../week1/lab1))
1. run the tests by running ```cabal test``` (this step is less important for this lab since many of the answers are open ended)
1. run ```git status``` to make sure everything is ok
1. run ```git commit -a -m "whoo hoo I'm done with lab 2"``` to make a commit on your laptop
1. run ```git push``` to submit your work
1. check that you can see your solutions on the website for your private repo
   
## REPL hints
* `:reload` will reload the file
* `:type` will tell you the type of an expression (we will cover on 9/13)
* `:quit` will leave the repl

## ```git``` issues
If you are having ```git``` issues, run ```git status``` and call on Mark for help.

## Notes
### 9:05 Lab
 * I made a typo on the ```Craziests``` data type that will result in an error. ```Train Craziests (List a)``` should have been ```Train (Craziests a) (List a)```.

## Optional Bonus: Sharing Tests, and correcting my spelling
We will allow you to share tests with the class. To do this 
 * Make a fork of the class repo: https://github.com/BU-CS320/Fall-2018
 * clone your fork locally (keep it separate from your assignment clone)
 * go to the test directory (in this case Fall-2018/assignments/week2/lab2/tests)
 * add a test
 * push the test up to your fork
 * https://help.github.com/articles/creating-a-pull-request/
 * If your test looks good we will accept it

Note that there are several freeform answers in lab this week that will not really be testable
