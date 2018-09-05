# Lab 1

## Setup
* Install the latest version(8.4.3) of [Haskell Platform](https://www.haskell.org/platform/)
  * Open your terminal and type ```ghci``` you should see ```GHCi, version 8.2.2: http://www.haskell.org/ghc/  :? for help```
  * Type ```:q``` to quit
* If you have not already, sign up for a free GitHub account following these [instructions](https://help.github.com/articles/signing-up-for-a-new-github-account/)
* If you have not already, set up git on your computer following these [instructions](https://help.github.com/articles/set-up-git/)
* run ```cabal update```
* run ```cabal install tasty``` and ```cabal install tasty-hunit``` to get the test libraries.

## First Haskell Program
* Follow this [link](https://classroom.github.com/a/1ShFqja_) to create an assignment repository
  * Press the "Accept this assignment" button, this will create a private repository for your solutions
  * When the cloning finishes, you will see a link like "Your assignment has been created here: [link to your new private repo]", click that link.  You will know you are looking at your private repo becuase you will see ![Lock icon BU-CS320/weel1- your user name Private](img/private-repo.png) on the top of the web page.
  * Clone your personal assignment repo by following the instructions [here](https://help.github.com/articles/cloning-a-repository/)
  * ```cd``` into the newly created directory by typing ```cd week1-username``` with ```username``` replaced with your user name
  * You always want to take advantage of the latest corrections to the assignments and shared tests so we will add the main repository as a source
    * In your terminal type ```git remote add upstream https://github.com/BU-CS320/Fall-2018.git```
    * check that it worked by typing ```git remote -v```.  You should see see the line ```upstream https://github.com/BU-CS320/Fall-2018.git (fetch)```
    * You always want to keep your assignment up to date by running ```git pull upstream master```, do that now
* ```cd```  into this assignment (```cd assignments/week1/lab1```), first we will write a greeting
  * run ```cabal new-repl``` in the terminal (it is important that you do this in the ```lab1``` directory).  You should see 
```
Preprocessing library for lab1-0.1.0.0..
GHCi, version 8.2.2: http://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Greeting         ( src\Greeting.hs, interpreted )
Ok, one module loaded.
```
* let's try to run a greeting by typing ```greeting```.  You should see an error
  * fix the error by opening lab1/src in your favorite text editor on the line that says ```greeting = undefined``` change ```undefined``` to your favourite greeting in quotes.
  * save the file
  * reset the terminal by typing ```:reload```
  * now if you type ```greeting``` into the terminal you should see your greeting
  * Haskell is a functional language so define the identity function by changing ```ident x = undefined``` to  ```ident x = x```
  * type ```:q``` to quit the REPL in the 
  * run the tests by running ```cabal test```
  * make a commit by typing ```git commit -a -m "my first commit"``` into the console
  * submit your work by typing ```git push```


## A Quick Survey
Complete the survey by adding your answers to [survey.md](survey.md).  You may do this through the text editor or through the GitHub interface.

## Notes
### 9:05 Lab
 * there is a [bug](https://github.com/haskell/cabal/issues/4602) in cabal that we ran into.  The instructions now include the fix.

## Bonus: Sharing Tests, and correcting my spelling
We will allow you to share tests with the class. To do this 
 * Make a fork of the class repo: https://github.com/BU-CS320/Fall-2018
 * clone your fork locally (keep it separate from your assignment clone)
 * go to the test directory (in this case Fall-2018/assignments/week1/lab1/tests)
 * add a test
 * push the test up to your fork
 * https://help.github.com/articles/creating-a-pull-request/
 * If your test looks good we will accept it
