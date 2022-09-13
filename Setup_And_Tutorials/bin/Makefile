current_dir := ${CURDIR}
TARGET := basys3

# IMPORTANT: edit this next line if the name of your top level module is not 'top'
# You are not specifying a file name (there is no .sv).
# You specifying the name of the SystemVerilog that is the top level of your hierarchy.  
# Example: If your file is named myfile.sv but
#   inside that file you have `module myTopLevel(input logic clk, clr, ...`
# then you would specify `TOP := myTopLevel` on the next line.
TOP := top

# This next line will include all .xdc in the current directory for compilation. There should only be one.
# If there is a problem, replace the * with the name of the xdc file
XDC := ${current_dir}/*.xdc

# This next line will include all .v and .sv files in the current directory for compilation.
SOURCES := $(wildcard ${current_dir}/*.v ${current_dir}/*.sv)

# This actually does the compilation
include ${F4PGA_EXAMPLES_ROOT}/f4pga-examples/common/common.mk

