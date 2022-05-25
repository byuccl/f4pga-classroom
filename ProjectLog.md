# Project Log
This page will contain things learned, issues, etc. as we work through things.

### 1. Install challenges
- On a failed install, should `rm -rf ~/f4pga-examples ~/opt` before trying again

### 2. Missing Instantiation Names
- Vivado seems OK with missing instantiation names in .sv code, F4PGA not so much.  Is this a bug with F4PGA?  What does the standard say? (Zach)

### 3. Common .xdc File
- Some students didn't create a new .xdc file for each lab but used the same one.  Something to watch out for, not fatal.

### 4. Clock Command in .xdc File
- F4PGA is unhappy with the full clock command line in the .xdc file:
```
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
```
Needs to be shortened to:
```
create_clock -period 10.00 [get_ports {clk}]
```

### 5. Remove Testbench Files
- In some projects the testbench file is in the DesignSrcs element of the .xpr file and so shows up in the directory to be compiled.  
  - The testbench files must be removed by hand.
- Vivado is OK with this since it knows what the top level module is and so only bothers to compile what is needed.
- The Makefile we are using with F4PGA compiles ALL .sv and .v files and chokes on testbench files.  The fix would be to explicitly state which .sv and .v files are to be used in the Makefile instead of the wildcard that is there...

### 6. Error Message on Bad .xdc File
- The error message w.r.t. .xdc file problems is not very clear.  It is:
```
ERROR: set_property IO_LOC_PAIRS: Incorrect number of arguments.
```
But, recognizing this does point to the source of the problem (the .xdc file).

### 7. Trailing Spaces in Makefile
If there are trailing spaces in the Makefile's lines that start with `TARGET := basys3` and `TOP := top` then the toolchain will fail.  

Fixed with PR #243.
