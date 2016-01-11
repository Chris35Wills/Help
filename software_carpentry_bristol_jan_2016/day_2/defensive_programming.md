#######################
# Defensive programming
#######################

> Testing is required really for scientific software - a kind of guarentee
> Debugging takes ages - prevent it!!
> One line bug --> Jeffery Chian - proteins - software testing - retracted 5 papers from science -- RARELY actually happens!! Make sure you test your code!!!

####################

## Using the "assert" command

assert True # returns nothing
assert False # returns traceback showing an assertion error

num = 1.0
assert (num > 0.0) # returns nothing

num = 1.0
assert (num < 0.0) # returns assertion error

############

a = 2.005 

# greater than 2 assertion here
assert a > 2

# within 2 decimal places assertion here
assert (a > 1.99) and (a < 2.01)

# within 0.003 assertion here
assert abs(a-2) < 0.003
# will be false therefore give AssertionError if greater!!

##############
##Nose

Computers may have very small decimal errors 

Can mean your assertions fail unexpectedly

Check out the nose.tools package

The nose testing framework has built-in assertion types implementing assert_almost_equal, assert_true, assert_false, assert_raises, assert_is_instance, and others.

assert_almost_equal takes optional arguments places and delta

	from nose.tools import assert_almost_equal
	a= 2.005
	assert_almost_equal(a, 2, places=2)
	# 0.003 assertion here
	assert_almost(a,2,delta=0.003) 
	# returns error: AssertionError: 2.005 != 2 within 0.003 delta

#################
## define and test simple function

### using assert

def mean(num_list):
	# check if error is not present
	assert len(num_list) != 0 # if true, program will continue - false will cause an assertion error

	return sum(num_list)/len(num_list)

print(mean([1,2,3]))
print(mean([]))

### raising/throwing exception
### will crash and print out exception message

def mean(numbers):
	# check if error is present
	if len(numbers) == 0:
		raise Exception("The length of the list is too short")

	value = sum(numbers)/len(numbers)

	return value

numbers=[]
print(mean(numbers))

### try/accept block
### deal with exception (don't crash!)

def mean(numbers):
	# check if error is present
	if len(numbers) == 0:
		raise Exception("The length of the list is too short")
	value = sum(numbers)/len(numbers)
	return value

numbers = []

try:
	print(mean(numbers))
except:
	print("This is an empty list")

##### integrate functions and exceptions

def mean(num_list):
    """Calculate the mean of a list of numbers

    The values of the list must be numeric and of finite size
    """
    try:
        return sum(num_list)/len(num_list)
    except ZeroDivisionError as detail :
        msg = "The algebraic mean of an empty list is undefined."
        msg += "Please provide a list of numbers."
        raise ZeroDivisionError(detail.__str__() + "\n" +  msg)
    except TypeError as detail :
        msg = "The algebraic mean of an non-numerical list is undefined."
        msg += "Please provide a list of numbers."
        raise TypeError(detail.__str__() + "\n" +  msg)


########
## Unit testing

Unit tests are just other functions
Calls a function to be tested with data for which you know what the output should be and calls assert to check if correct.

def mean(num_list):
    """Calculate the mean of a list of numbers

    The values of the list must be numeric and of finite size
    """
    try:
        return sum(num_list)/len(num_list)
    except ZeroDivisionError as detail :
        msg = "The algebraic mean of an empty list is undefined."
        msg += "Please provide a list of numbers."
        raise ZeroDivisionError(detail.__str__() + "\n" +  msg)
    except TypeError as detail :
        msg = "The algebraic mean of an non-numerical list is undefined."
        msg += "Please provide a list of numbers."
        raise TypeError(detail.__str__() + "\n" +  msg)


mean([1,2,3])

def test_ints():
	numbers = [1,2,3,4,5]   # set of test data
	obs = mean(numbers)     # using function
	exp = 3 				# expected value (you know mean of 1->5)
	assert obs == exp        # if function works, true assertion and therefor no return

def test_reals():
	numbers = [1.0,2.0,3.0,4.0,5.0]   # set of test data
	obs = mean(numbers)     # using function
	exp = 3.0 				# expected value (you know mean of 1->5)
	assert obs == exp        # if function works, true assertion and therefor no return

def test_long():
	big = 10000 
	exp = big/2.0 # expected average
	obs = mean(range(1,big)) # mean of list of 1 --> 10000
	assert obs == exp 

## Bulk running unit tests

If you keep all of your unit tests in one file e.g.:

	from mean import *
	import unittest

	def test_ints():
	    num_list = [1,2,3,4,5]
	    obs = mean(num_list)
	    exp = 3
	    assert obs == exp

	    		etc....

You can call this file to run by being in the directory (on command line) and just typing 'nosetests' - nosetests works by searching for programs with *_tests.py in them to run them!!!

Unit tests run small parts of the code - integration tests are something else to look at. Also, regression tests - checks whther old output matches new output (i.e. if code changes through time, or if code provided from an article reproduces a table provided in a paper). Various elements can be tested, e.g. search domains etc.
