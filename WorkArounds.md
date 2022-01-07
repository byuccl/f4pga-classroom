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

Alternatively, they may have left their files in an incomplete state.  When the .xdc file doesn't map the top level pin names correctly, a common error you will get is this:
```
ERROR: set_property IO_LOC_PAIRS: Incorrect number of arguments.
```
Double-checking and fixing the .xdc file contents always fixes this.