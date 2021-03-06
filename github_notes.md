---
layout: page
title: Github 
permalink: /githubbits/
---

All things Github related - there's plenty of help available from Git. I just noted down the bits I find myself continually revisiting. 
A good place to visit for a proper "how to course" in terminal casn be found [here](http://learnpythonthehardway.org/book/appendixa.html)

##First time repository set-up

	1. Change your directory to that which you would like to have as a repository
	2. to set as repository > `git init` ## this creates a hidden file that allows github to track the repository you've just initialised
	3. to add files > `git add [file.extension]` ## you can replace file.extension with wildcards e.g. *.bil
	4. to commit added files > `git commit -m "Whatever you want to see associated with the tracked change"` ## see glossary - the '-m "blah"' is the commit message
	5. to link repository (local) with remote > `git remote add origin http://.....` # the path can be accessed from a newly set up repo on the github website
	6. to push files to remote type > `git push -u origin master`

	NB/ origin is essentially the local folder and master is the remote

##Day to day file update

	1. Change some stuff
	2. to add files > `git add [file.extension]` ## you can replace file.extension with wildcards e.g. *.bil
	3. to commit added files > `git commit -m "Whatever you want to see associated with the tracked change"`
	4. to push type > `git push`

##Pull files from remote to local

	1. Just type > `git pull` # assumes your already in the repository
	# this will update the local from the remote but won't overwrite any changes you've made in the local that haven't been pushed to the remote (!)
	# this will only update files linked with github i.e. if you have other stuff in the lcoal folder no in github, this won't be overwritten (so you won't lose stuff)

##Fix merge conflicts

Occurs where a file in a repo is changesd but differs from the version in the repo (that was never pulled in before changes were made)
Where this occurs:
	1. `git mergetool`
	2. Conflict regions are highlighted in document in an editor that will pop up - make alterations (i.e. address conflict) and then save
	3. Now try and push again...
	4. If still not working, search "fix github merge conflict"

##Access old versions of things

A key benefit of using git is version control so it helps to know how to get old version of things...

	1. `git log` # or # `git log --oneline`
	2. `git checkout 32700d0` (i.e. the code of the  version of the repo that you want - see how useful helpful commit messages can be!!)

	### Now you can copy things out of a file from this version of the repo etc..
	### Don't add or commit at this stage as bad things will happen that will likely ### cause more confusion than necessary unless you're a decent hack (whereby you ### likely won't be reading anything on this site)

	3. When you're done: `git checkout head` # now you're back where you were before you checked anything out

##Key commands

>`git add` - tells it that a change is to be part of a commit
`git commit` - saves a version to the history (doesn't change anything to the remote unless pushed)
`git push` - copies local to remote
`git status` - tells you what is going on

This might also be useful:
>`git remote rm origin` - remove origin (if you want to create a new one)