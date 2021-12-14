## Testing Your Own Designs
When you get ready to create your own design, do the following:
1. Go inside your repo by typing at the command prompt one of the following: `cd 220_yourName` or `cd 323_yourName`.
2. Create a lab-specific project directory in there to hold your lab files like this: `mkdir Lab3`.  
3. Go into that project directory using `cd Lab3`.
4. Copy your SystemVerilog files and your XDC file into this directory.  NOTE: there cannot be any subdirectories inside here - your files all just live in this directory.
5. Now, create a file called `Makefile` here with these contents and save it.
```
current_dir := ${CURDIR}
TARGET := basys3

# IMPORTANT: edit this next line if the name of your top level module is not 'top'
TOP := top

# IMPORTANT: edit this next line to specify the name of your .xdc file if different
XDC := ${current_dir}/basys3.xdc

# This next line will include all .v and .sv files in the current directory for compilation.
SOURCES := $(wildcard ${current_dir}/*.v ${current_dir}/*.sv)

# This actually does the compilation
include ${HOME}/symbiflow-examples/common/common.mk
```
5. Now you can compile your design by executing `make` inside your project directory.  

As above, as the tool runs it should be clear if there were errors in compilation by watching the text output.  If the tool runs successfully, there should be a .bit file in `build/basys3/top.bit` which you can download to the board using the download mechanism you use in class.  For example, if you are using Vivado to download you can just start it up, open the hardware manager, and then download the .bit file after navigating to it.  NOTE: you will not have a Vivado project or anything else from 220 when you do this - you are simply using Vivado as the board programming tool.

On the other hand, if the tool did not run successfully we are very interested in learning why.  If you get errors and a new .bit file is not created please get with one of the Symbiflow TA's to review the outcome.  It may be simply that you didn't create your Makefile correct or some other setup problem of yours.  We would like have the TA's help you figure this out so we don't report problems that really aren't the fault of Symbiflow.  If the TA can help you fix things so you get a working .bit file, great.  If not, that is OK.

## Documenting the Results of Your Tests
1. Regardless of whether the compilation gave errors, we want you to capture the output of the compilation using `make >& compile.log`.  Do this in the project directory.
2. Next, create a file in your project directory called `README.md`.  
3. If the bitstream worked on the board, your README.md file contents can be simple - just say that it compiled without errors and that the bitstream worked.
4. If the compilation gave an error, say so.  Then, pull the compilation error messages out of the compile.log file you just created and included them in the README.md file.  You can put verbatim text (like what you copy from the log) into the README.md file by placing three backquote characters on a line (the backquote is the on the same key as the tilde).  Then paste what you copied from log file into the README.md.  Then, put three backquote characters on a line.  That is a "code verbatim" block in markdown. 
5. Finally, save the README.md.

## Pushing Your Results Back Up to Github
1. Now, you need to tell git that you have a new directory of files that should be a part of the repository.  So, type: `git add .`.  This will tell git that you want this directory's contents to be a part of the repository.
2. Next, formally commit those files to git by typing: `git commit -am "Put a message here telling what you did for this commit".  Now, your project files are a part of git.
3. Next, add a tag to this version of the files by typing: `git tag -a Lab3` (or whatever this lab is called).  This will tell the TA that this is your final submission.
4. Finally, push these new files up to Github by typing: `git push`.

At this point this lab and its results are up at your Github page.  To be sure, go there in a web browser.  Click around and look at things.  If you click a directory such as `Lab3`, your README.md file contents will be the documentation that shows in the web browser.  Pretty slick.

As you look around, if you find that something is not right, you can always repeat the steps above (re-run, edit your README.md file, re-commit, re-tag, re-push).  When you do so and refresh your browser you should see the new contents.

That is it!  You have successfully completed one lab.  Hopefully future ones will go more quickly and you will be able to complete all of them.
