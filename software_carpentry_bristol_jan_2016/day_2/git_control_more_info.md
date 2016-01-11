#####################
# Git version control
#
# Andrew Walker
# 07/01//16
#####################

You don't need to be online to make commits - and that means you can keep checking your log
You only need to be online to do a git push.

Make a habit of using git commit as you make changes. Small changes are easier to fix than big ones.
Use git push less often - no need to do it each time! Although, git push is your "back up"

git log
git diff 
git diff --staged
ls -A

## Linking your local to the remote for the first time:

Simply add repo online on github and it gives you the options:

#~~~~~~~~~~~~
create a new repository on the command line

	echo # planets >> README.md
	git init
	git add README.md
	git commit -m "first commit"
	git remote add origin https://github.com/Chris35Wills/planets.git
	git push -u origin master

#~~~~~~~~~~~~
push an existing repository from the command line

	git remote add origin https://github.com/Chris35Wills/planets.git
	git push -u origin master

#~~~~~~~~~~~~~
Colaborating

He who would like collaborators:
Go to repo/ settings/ add collaborator user name - will send email to potential collaborator allowing them to modify the repo

He who will collaborate:
1. The collaborator now needs to go to the address of the other persons repo
2. On github, copy the https link
3. Make a new directory locally (separate directory, not in same location as any other repo of the same name as to that which you will now clone!)
4. Use: git clone https://github.com/erikmackie/planets.git
5. cd into the cloned log and you can now run "git log"

#...
colaborator can now change, add, commit and push things
as changes are made, others need to update their repos:
	need to use "git pull" to get your repo up to date

#.. conflicts
two collaborators change same file
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

#~~~~~~~~~~~~~~~
#List remotes

The remote is the online path - these can be changed if required

git remote
git remote -v


#~~~~~~~~~~~~~~~~
# Branching

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

	... now add something else to the moons branch

	> git checkout -b ganymede
	> add a file 
	> git add file.txt
	> git commit -m "add new file"
	 
	... now need to merge the branches:

	> git merge moons
	> will open a vim window in which to type a merge message (type somethimg and exit with q!)
	> will merge master and moons branches
		> if conflicts, fix the same way as with a git pull conflict (go in file, change, add and commit etc.)

	More reading:
	fast forward merge vs. recursive merge


Enable "Commit access" for trusted members - you can;t vet commits!
If you don;t know who is adding and want to vet things, then a different approach is required. 

To vet each commit, a collaborator must clone your repo using web browser, they change their version, make pull request - this then asks you to accept or refute merges - you can annotate their changes too.

order:

1. clone (or git fork) ('collaborator')
2. branch ('collaborator')
3. make pull request ('collaborator')
4. person in charge of original accepts or refutes ('owner')
