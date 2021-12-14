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
1. Regardless of whether the compilation gave errors, we want you to capture the output 
2. First, create a file in your project directory called `README.md`.  
3. If 
