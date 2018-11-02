# Fall-2018

[website](http://www.cs.bu.edu/fac/snyder/cs320/) [piazza](https://piazza.com/class/jlpaiu7tfht5ro?cid=15)

The notes and assignments for 320

## Forking and Adding tests
We will allow you to share tests with the class.  These instructions are a work in progress, please add to them.
### Small changes
 1. Click the pencil in the upper right corner
 1. edit the file
 1. press "Create a new branch for this commit and start a pull request"
 1. click the make pull request button
 1. wait for aproval, you will see your request under "Pull requests"
 1. Someone will merge you commit or comment about why it can't be merged
 1. if there are problems with you commit you will need to follow some of the instructions bellow to fix it

### Large changes
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
 	1. Once you get to this page, you will see this at the top ![](ing/gitpullrequest.JPG). This will compare your forked repository with the master branch.
 	1. Then click __Create a new pull__
 	1. Add any comment you want
 	1. Then click __Create a new pull__ at the bottom of the page ![](ing/push-and-pull.gif)
 	1. After this you should have successfully put in the pull request, and now just wait for the person with the access to the master branch to accept the request.
