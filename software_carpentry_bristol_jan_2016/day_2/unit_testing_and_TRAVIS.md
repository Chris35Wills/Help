########
# Travis
########

https://travis-ci.org

Works on same credentials as git
Unit testing
Sync with your github
Works with public repos for free
Assuming you have a repo with testin module installed using the nose package
Turn on (tick) the repo you want travis to be interested in

# Instructing travis how to test your code

You need a nother file in your repo to instruct travis what to do each time you commit something - call this ".travis.yml" - here you'll tell it what language and version you want ravis to deal with for a given repo that it is watching e.g.

	.travis.yml

	language: python
	python:
		- "3.4"
		- "nightly"
	install:
	 	- "pip install -r requirements.txt"
	script: nosetests

Another file is also required to tell travis what needs to be installed to run your tests. For example:

	requirements.txt

		nose
		numpy

Push these .travis.yml and requirements.txt files to github - travis is following you so know this will have been added!

######

Now go back to travis