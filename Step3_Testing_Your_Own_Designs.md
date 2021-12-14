## Testing Your Own Designs
When you get ready to create your own design, do the following:
1. Go inside your repo as in `cd 220_yourName` or cd `323_yourName`.
2. Inside there, create directory to hold your lab files as in: `mkdir Lab3`.  
3. Go into that directory using `cd Lab3`.
4. Copy SystemVerilog files and your XDC file into this directory.  There cannot be any subdirectories inside here - they all must just be together here.
5. Now, create a file called `Makefile` here with these contents:
```
current_dir := ${CURDIR}
TARGET := basys3

# Edit this next line if the name of your top level module is not 'top'
TOP := top

# Edit this next line to specify the name of your .xdc file if different
XDC := ${current_dir}/basys3.xdc

# This next line will compile all .v and .sv files in the current directory
SOURCES := $(wildcard ${current_dir}/*.v ${current_dir}/*.sv)

# Edit this next line if you did not install everything in $HOME as discussed above.
include ${HOME}/symbiflow-examples/common/common.mk
```
5. Now you can compile your design by executing `make` inside your project directory.

As above, it should be clear if there were errors in compilation by watching the text output.  And, there should be a .git file in `build/basys3/top.bit` which you can download to the board using the download mechanism you use in class.  For example, if you are using Vivado to download you can just start it up, open the hardware manager, and then download the .bit file after navigating to it.  NOTE: you will not have a Vivado project or anything else from 220 when you do this - you are simply using Vivado as the board programming tool.

Finally, every time you modify either one of your source files or your .xdc file you can type `make` and it will recompile everything and generate a new bitfile.
