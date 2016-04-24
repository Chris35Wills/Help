# Introductiuon to HPC

ls -l # list all visible
ls -la # list all visible and invisible


Slides:  [https://www.acrc.bris.ac.uk/acrc/Intro-HPC-2014.pdf](https://www.acrc.bris.ac.uk/acrc/Intro-HPC-2014.pdf)
Trainer: Callum Wright

beowolf cluster - distrib. memory
2006 - phase 1
2009 - pahse 2
2013 - phase 3
2016 - phase 4 pending

node - "pizza boxes" - portion of shared memory
Supercomputers - sealed so you can control cooling!

RDSF...

Jobs:
1. prepare
2. submit
3. queue (starts based on resources)

Can be used for large memory serial jobs

IDL?

##Paraellism

MPI 	- can use all nodes
		- sweet spot for how many processes you can run at once before communication etc. slows things down

openMP  - runs on one node but uses shared memory
		- good for parellising loops
 
# Signing in 

Windowning on unix is called X

To run through on a windows machine, you need an x server - this is Xming!

This is why xming is run with putty

## Linux

If on linux

## Setting up Putty

Firstly, enable x11 forwarding
Host name: bluecrystalp2.acrc.bris.ac.uk
Port: 22

File transfer through SCP (mac/linux) or WinSCP (windows)

## External to university

Firewall will block it
Must run VPN
See setting up VPN on the IT services page

# Usage

##General

Use top to work out how much memory will be used...
Can run ~20min test jobs on the nodes if you want

##Software

If you need something, do it locally or ask so it can be loaded globally

Finding and ammending programmes that are availebl: the Module command...

module avail # shows what's there
module add *module-name*
module del *module-name*
module list # what is loaded in your environment NOW (usually sytem modules - don't remove them!!!)

If running a job, make sure your bashrc adds the right modules!
Amend your .bashrc as required (nano .bshrc) e.g.

	module add languages/python-2.7

Can clean your lcoal environment using:

	module del *module-name*

##Queuing

Fair share policy 
	- people can't dominate! There are limits.
	- considers users and groups

Usual wait ~2 hours BUT sooner rather than later

##Submitting jobs

## simple example 1

###create script

job1.sh

	#!/bin/bash
	#
	#
	# Define working directory
	export WORK_DIR=$HOME/workshop
	# Change into working directory
	cd $WORK_DIR
	# Execute code
	/bin/hostname
	sleep 20

#run script

> qsub job1.sh 

> 	3013730.bluequeue1.cvos.cluster # prints out

#check jobs stats

> qstat 3013730

>	Job id                    Name             User            Time Use S Queue
	------------------------- ---------------- --------------- -------- - -----
	3013729.bluequeue1        job1.sh          cw14910                0 Q veryshort

# check output (automatically created)

job1.sh.e3013729  # error file
job1.sh.o3013729  # output file

## simple example 2

Look at job2.sh

The next line at the top of the script and tells bluecrystal what you need (no. nodes, amount of time etc.) << try and get this right and don't just apply for the maximum!!

	#PBS -l nodes=1:ppn=1,walltime=1:00:00 

If you don't set walltime, it will use the minimum (a couple of hours)
You need to have an idea of how long you'll need to allocate - try and run some tests... e.g. scaling tests etc.
If you aren;t sure go for a few days...
15 days is the maximum
Ensure your code can take off from where it left if it crashes!!

## Monitoring jobs (see *monitoring jobs* slide)

qstat -u hb1864 -an1

where -u is the user and the -an1 flag shows where it is running

> top

You want cpu to be about 100% - that's good
Consider also memory usage

e.g.

qsub job4.sh
qstat -u cw14910 -an1 # cw14910 is the username

Keep jobs simple -one script for each job submission
That way, if it crashes, you know what broke - 

See slide 41 
Create s anew script for each file
ensure you use "sleep xx" (e.g. sleep 10) - that way you don;t overload the system all at once

##IDL

Ask if it can be loaded
Maybe run like MATLAB - see pp46 of slides

If writing your scripts on windows, you can use dos2unix to convert it OR just write the scripts on bluecrystal/in unix

Help - don't create a normal ticket - email hpc-help@bristol.ac.uk directly

##Misc

3TB storage space per user
Scratch space - not backed up!!
Don't use it as a backup


