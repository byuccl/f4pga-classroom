# Work-Arounds and Answers
Symbiflow is a tool still under development.  The purpose of this study is to identify problems and report them as bugs.

However, some basic issues will be encountered and, without, working around those no designs will work.

This page contains the current work arounds needed to get your designs to go through.  Hopefully the list will stay VERY short.

It also points out some common errors.

## 1. Clocking Statement in .xdc Files
The clocking statement used to set the clock period to 100MHz is this:
```
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
```

However, Symbiflow cannot parse that entire command.  The workaround is to replace it with this:
```
create_clock -period 10.0 [get_ports {clk}]
```

## 2. Bogus .xdc File Contents
Some students re-used the same .xdc file for all their labs.  This means what is left in their directories is only valid for the last lab.  

Alternatively, they may have left their files in an incomplete state or there other problems in their .xdc files.  When the .xdc file doesn't map the top level pin names correctly, a common error you will get is this:
```
ERROR: set_property IO_LOC_PAIRS: Incorrect number of arguments.
```
Double-checking and fixing the .xdc file contents usually fixes this.

## 3. Spelling
Linux is not fundamentally a GUI-based O/S.  Everything is typically done through the command line.  As such, it is very easy to mis-type things and then be confused why it didn't work.  If your file is named `arithmetic_top.sv` and your top level module is `arithmetic_top` and you specify `arithemetic_top` as the TOP module in the Makefile, you won't get what you want and may not understand the error message.  So, when things don't work as expected carefully examine everything - chances are that you may have mis-spelled something.

## 4. Symbiflow initializes flip flops to '1'
It seems Symbiflow designs don't always power up with all the flip flops at a '0' value.  Sometimes they are '1' values, meaning you design won't work the way you want until after you reset it for the first time.
