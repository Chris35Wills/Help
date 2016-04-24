=====================
GitHub (command line)
=====================

READING: 

[Github pro manual - everything!](https://progit2.s3.amazonaws.com/en/2016-01-06-b561b/progit-en.984.pdf)
[Undoing changes](https://www.atlassian.com/git/tutorials/undoing-changes/git-checkout)

----------------------------
First time repository set-up
----------------------------

1. Change your directory to that which you would like to have as a repository
2. to set as repository > git init ## this creates a hidden file that allows github to track the repository you've just initialised
3. to add files > git add [file.extension] ## you can replace file.extension with wildcards e.g. *.bil
4. to commit added files > git commit -m "Whatever you want to see associated with the tracked change" ## see glossary - the '-m "blah"' is the commit message
5. to link repository (local) with remote > git remote add origin http://..... # the path can be accessed from a newly set up repo on the github website
6. to push files to remote type > git push -u origin master

NB/ origin is essentially the local folder and master is the remote

-----------------------------------------
Remember credentials for a period of time
-----------------------------------------

This saves you retyping your username and password for a period of time (set accordingly) whilst in a repo:

	git config --global credential.helper "cache --timeout=3600"

-----------------------
Day to day file update
-----------------------

1. Change some stuff
2. to add files > git add [file.extension] ## you can replace file.extension with wildcards e.g. *.bil
3. to commit added files > git commit -m "Whatever you want to see associated with the tracked change"
4. to push type > git push

-------------------------------
Pull files from remote to local
-------------------------------

1. just type > git pull # assumes your already in the repository

this will update the local from the remote but won't overwrite any changes you've made in the local that haven't been pushed to theremote (!)

this will only update files linked with github i.e. if you have other stuff in thelcoal folder no in github, this won't be overwritten (so you won't lose stuff)

-------------------
Fix merge conflicts
-------------------

Occurs where a file in a repo is changesd but differs from the version in the repo (that was never pulled in before changes were made)

Where this occurs:

1. git mergetool
2. COnflict regions are highlighted in document in an editor that will pop up - make alterations (i.e. address conflict) and then save
3. Now try and push again...
4. If still not working, search "fix github merge conflict"

-----------------------------
Access old versions of things
-----------------------------
A key benefit of using git is version control so it helps to know how to get old version of things...

1. git log # or # git log --oneline
2. git checkout 32700d0 (i.e. the code of the  version of the repo that you want - see how useful helpful commit messages can be!!)

Now you can copy things out of a file from this version of the repo etc..
Don't add or commit at this stage as bad things will happen that will likely - cause more vonfusion than necessary unless you're a decent hack (whereby you likely won't be reading anything on this site)

3. When you're done: git checkout head - now you're back where you were before younchecked anything out

-------------------------------------------------------------
Check file changes before you add a file to the staging area
-------------------------------------------------------------

	git diff

-------------------------------------------------------------
Check file changes once file is added to the staging area
-------------------------------------------------------------

	git diff --cached

---------------------------------------
Check which files you are about to push
---------------------------------------

	git diff --stat --cached [remote/branch]

For example (http://stackoverflow.com/questions/3636914/how-can-i-see-what-i-am-about-to-push-with-git):

	git diff --stat --cached origin/master

---------------------------
See history of past commits
---------------------------

	git log

---------------------------
See log of unpushed commits
---------------------------

From here: http://stackoverflow.com/questions/2016901/viewing-unpushed-git-commits

	git log --stat origin/master..HEAD

-----------------------------------
Undoing, fixing or removing commits
-----------------------------------

Read more here: http://sethrobertson.github.io/GitFixUm/fixup.html#committed

----------------------------------------
Reset the directory to a previous commit 
----------------------------------------

This is useful if you have made a commit that you haven't yet/can't push
(See: http://stackoverflow.com/questions/1611215/remove-a-git-commit-which-has-not-pushed)

1. git log <- gets a list of past commits
2. git reset --hard commit_id
	e.g. git reset --hard eb27bf26dd18c5a34e0e82b929e0d74cfcaab316

IMPORTANT: This will remove any work you've done since the commit you are resetting to so make sure you have a BACKUP of your git repo somewhere else as this is somewhat annoying when you realise you've deleted work.

------------
Colaborating
------------

He who would like collaborators:
Go to repo/ settings/ add collaborator user name - will send email to potential collaborator allowing them to modify the repo

He who will collaborate:
1. The collaborator now needs to go to the address of the other persons repo
2. On github, copy the https link
3. Make a new directory locally (separate directory, not in same location as any other repo of the same name as to that which you will now clone!)
4. Use: git clone https://github.com/erikmackie/planets.git
5. cd into the cloned log and you can now run "git log"

Colaborator can now change, add, commit and push things as changes are made, others need to update their repos:

	need to use "git pull" to get your repo up to date

Enable "Commit access" for trusted members - you can;t vet commits!

If you don't know who is adding and want to vet things, then a different approach is required. 

To vet each commit, a collaborator must clone your repo using web browser, they change their version, make pull request - this then asks you to accept or refute merges - you can annotate their changes too.

Order:

1. clone (or git fork) ('collaborator')
2. branch ('collaborator')
3. make pull request ('collaborator')
4. person in charge of original accepts or refutes ('owner')

---------
Conflicts
----------
two collaborators change same file (or you correct the same file on two local repos!!)

one will push and succeed

one will push and fail - fail to push... updates rejected...

> now need to pull
> will tell you there is a conflict ("Automatic merge failed,; fix conflicts and then commit result.")
> open the conflicted file and it will flag where the problems are e.g.

	Cold and dry, but everything is my favourite colour.
	But the two moons might be a problem for Wolfman.
	This is another line
	<<<<<<< HEAD
	I am altering the planet Mars.

	This is gonna get complicated. 
	=======
	I am altering the planet Mars. 
	<<<<<<< HEAD

	Mars is a desolate hell hole. We've all seen Total Recall.
	=======
	Mars is a red planet and ice has been found on the surface.
	>>>>>>> 8a0d9865252654c5bc82e3793361a71eb81da74b
	>>>>>>> d5a4879e50aeba2c23df711549d60a33f2a437a8

	> the bit <<<<<HEAD shows where the conflict starts
	> the bit >>>>>>> d5a4879e50aeba2... shows where the conflict ends
	> correct accordingly

	Cold and dry, but everything is my favourite colour.
	But the two moons might be a problem for Wolfman.
	This is another line
	
	I am altering the planet Mars.
	This was complicated but is now fixed.

	> now commit and push
	> if you are out of sync with master, use git pull then push again
	> if diff files are added and not conflicted, the push will automatically merge everything - the log may then give a message liek: "Merge branch 'master' of https://github.com/erikmackie/planets"

------------
List remotes
------------

The remote is the online path - these can be changed if required

	git remote
	git remote -v

---------
Branching
---------

Branch points to the previous commit


You want to work on branches when implementing something new before merging the branch with the main code.

This is another way to collaborate - create a branch - work on it and then merge the branch with the master.

git push origin master (or just git push) >>> remote to push to and branch you want to push

A branch is a label to the top of a stack of commits

New branch added to tip of master 

Create a new branch called moons:

	> git checkout -b moons	
	> make a new file... io.txt
	> git add io.txt
	> git commit -m "heat pipe moon"

	> git branch < shows what branches are available

... now want to add something to another branch

	> git checkout master
	> git log (won't tell you about things that happened on the moons branch)
	> amend a file, or add something...
	> git add mars.txt
	> git commit -m "mars additional info"
	> git log < will show the new commit

	... now add something else to another branch

	> git checkout -b ganymede
	> add a file 
	> git add file.txt
	> git commit -m "add new file"
	 
	... now need to merge the branches:

	> git merge moons
	> will open a vim window in which to type a merge message (type somethimg and exit with q!)
	> will merge master and moons branches
		> if conflicts, fix the same way as with a git pull conflict (go in file, change, add and commit etc.)

-----------
Sorting out the *pathspec is in submodule* error
-----------

Read [this](http://git.661346.n2.nabble.com/quot-submodule-quot-mistake-and-a-problem-td7568253.html)

In summary, if you get this error (likely when adding a subfolder in a a git directory), you can remove the path (which doesn;t delete the files) and then re-add everything.

e.g.

You are in folder test/ and you have a pathspec issue with test/problem/

	git rm -f --cached path/to/subdir   # remove from index, keep files 
	git add path/to/subdir
	
Now it should work. If not, make sure you don;t have any .git folders in the subfolders (likely to occur if you move a former repo into a new repo).

-----------
Submodules
-----------

**ADD SUBMODULE TO REPO** 

To keep git repos inside other git repos, you need to make use of submodules.

e.g. We have a folder on git call functions - to store another git repo e.g. andys_filter inside it (to allow future push/pull), we must clone it into the functions repo using this:

	> cd /path/to/functions
	> git submodule add https:/path.to.repo/andys_filter
	> git commit -m "Added andys_filter submodule"

see here for more info: 
http://stackoverflow.com/questions/1811730/how-do-i-work-with-a-git-repository-within-another-repository

**CLONING WITH SUBMODULES** 

To ensure submodules are cloned along with evrything else in the root module, you ned a few additional steps:

	> git clone git://url...
	> cd repo
	> git submodule init
	> git submodule update

Then each time you want to pull updates:

	> git pull ...
	> git submodule update --recursive

------------
More reading
------------

Fast forward merge vs. recursive merge
Branching!!!

=============
Quick summary
=============

git add - tells it that a change is to be part of a commit
git commit - saves a version to the history (doesn't change anything to the remote unless pushed)
git push - copies local to remote
git status - tells you what is going on

git remote rm origin - remove origin (if you want to create a new one)
git diff --stat --cached origin/master # check what is about to be pushed from origin to remote (see here: http://stackoverflow.com/questions/3636914/how-can-i-see-what-i-am-about-to-push-with-git)

Glossary
========

ADD
Adds a new file to a list that will be committed....

COMMIT
A commit, or "revision", is an individual change to a file (or set of files). It's like when you save a file, except with Git, every time you save it creates a unique ID (a.k.a. the "SHA" or "hash") that allows you to keep record of what changes where made when and by who. Commits usually contain a commit message which is a brief description of what changes were made.

PULL
Pull refers to when you are taking in changes. For instance, if someone has edited the remote file you're both working on, you'll want to pull in those changes to your local copy so that it's up to date.

PUSH
Pushing refers to sending your committed changes to a remote repository such as GitHub.com. For instance, if you change something locally, you'd want to then push those changes so that others may access them.

