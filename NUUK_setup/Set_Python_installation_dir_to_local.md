#Set Python installation directory to local on Nuuk

Modify the variable PYTHONUSERBASE and set it as:

	> nano .bash_profile
	
Insert: export PYTHONUSERBASE=$HOME/pythonuserbase

Save the changes

Make a directory in /home/cw14910/ of 'pythonuserbase' 

Then reload your bash profile to apply the any new settings

	> source .bash_profile

Now you can install anything you want (your python no longer see's the user python library)

	pip install --user scikit-image