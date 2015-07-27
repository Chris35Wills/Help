# Download a website and all of its associated comnponents for full access offline
==================================================================================

You need cygwin installed with the "wget" package - packages are installed with the installer (if ever you need another package, you must rerun the installer and ensure the package you want (search it in the window that comes up) is selected to be installed i.e. not "skipped") - [see here](https://cygwin.com/install.html).

In cygwin, ensure you are in the directory you want to save the website and all its assoc. stuff and then run code as discussed [here]( http://www.linuxjournal.com/content/downloading-entire-web-site-wget).

For example, I downloaded a site using this line of code:

	> wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --no-parent http://www.math.umt.edu/graham/stat544/