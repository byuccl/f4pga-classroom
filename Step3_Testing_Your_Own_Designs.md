## Running Your Own Designs
When you get ready to create your own design, you do the following:
1. Create a directory to hold your designs as in: `mkdir $HOME/220Sym`.  You do this just once to hold all your 220 designs you are going to try.
2. Create a specific directory hold one lab as in `mkdir $HOME/220Sym/Lab5`.
3. Create a new Makefile for your design as in: `touch $HOME/220Sym/Lab5/Makefile`.  This will create an empty file called Makefile.
4. Edit the file to contain these contents:
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
5. Now you can compile your design by executing the following:
```
cd $HOME/220Sym/Lab5
make 
```

As above, it should be clear if there were errors in compilation by watching the text output.  And, there should be a .git file in `Lab5/build/basys3/top.bit` which you can download to the board.

And, every time you modify either one of your source files or your .xdc file and type `make` it will recompile everything and generate a new bitfile.
