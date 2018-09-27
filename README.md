# Fall-2018

[website](http://www.cs.bu.edu/fac/snyder/cs320/) [piazza](https://piazza.com/class/jlpaiu7tfht5ro?cid=15)

The notes and assignments for 320

## Forking and Adding tests
We will allow you to share tests with the class. To do this 
 * Make a fork of the class repo: https://github.com/BU-CS320/Fall-2018
 * clone your fork locally (keep it separate from your assignment clone)
 * go to the test directory (in this case Fall-2018/assignments/week2/lab2/tests)
 * add a test
 * push the test up to your fork
 * https://help.github.com/articles/creating-a-pull-request/
 * If your test looks good we will accept it

Once you have followed the steps for forking a repository all you need to do now is clone the forked repository into your terminal. Then follow these steps:
 1. Need to add the ability to update your forked repository to keep it up to date with the master branch
 	1. '''cd'' into your forked repo
 	1. type '''git remote add upstream https://github.com/BU-CS320/Fall-2018.git''' 
 	1. type '''git fetch upstream''' then '''git pull upstream''' to update your forked repository with the master branch
 	1. Now just make your edits, whether it be fixing typos, adding test cases, etc.
 	1. Once you have made your changes, all you need to is push your changes to your forked repo to save your work.
 1. Pushing your work to the masterbranch
 	1. Once you push your changes, go onto github and click the tab pull requests.
 	1. Once in this tab, hit the button that says __New pull request__
 	1. Once you get to this page, you will see this at the top ![](gitpullrequest.JPG). This will compare your forked repository with the master branch.
 	1. Then click __Create a new pull__
 	1. Add any comment you want
 	1. Then click __Create a new pull__ at the bottom of the page ![](push-and-pull.gif)
 	1. After this you should have successfully put in the pull request, and now just wait for the person with the access to the master branch to accept the request.
