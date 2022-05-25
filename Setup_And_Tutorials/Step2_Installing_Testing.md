# Step 2

The default for students in class is to use the pre-installed F4PGA tools in the digital lab on the Linux machines.  Therefore, you can skip all of the rest of this document and move on to [Step3_Testing_Your_Own_Designs](Step3_Testing_Your_Own_Designs.md).

But, if you have spoken with the Professor and there is a reason for you to install the F4PGA tools in your own account, please continue on with the instructions below...

# 1. F4PGA Installation/Testing Instructions 
To use the F4PGA tools you will need to install the toolchain in your own directory.  
- It will install into your personal CAEDM space and so will be accessible from any of the 220 Lab computers.
- The installation will require about 6GB of space in your user space.

To install, go to https://github.com/chipsalliance/f4pga-examples, click on the Docs link (partway down the page), and follow the install instructions.

This will have created two directories in your home directory.  The first is called `opt` and the second is called `f4pga-examples`.  You need not necessarily do anything with them but you need to leave them there - they are the F4PGA tools installation.

## 1.2 Running a Test Design
There is a test counter design provided with F4PGA which you can build to test whether the toolchain is installed correctly.  

You can build it using the following commands:

```
export F4PGA_EXAMPLES_ROOT=$HOME
export INSTALL_DIR=$F4PGA_EXAMPLES_ROOT/opt/f4pga
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
cd $F4PGA_EXAMPLES_ROOT/f4pga-examples/xc7
rm -rf counter_test/build
TARGET="basys3" make -C counter_test
conda deactivate
```

If it all worked, the last part of the terminal text should be something like this:

```
...
The entire flow of VPR took 16.4372 seconds.
FASM extra: top_fasm_extra.fasm
writing final fasm
cd /home/nelson/f4pga-examples/xc7/counter_test/build/basys3 && symbiflow_write_bitstream -d artix7 -f top.fasm -p xc7a35tcpg236-1 -b top.bit
Writing bitstream ...
```

In addition, you should have a .bit file in directory: `$HOME/f4pga-examples/xc7/counter_test/build/basys3/top.bit` which you can use to program your board. It is a simple counter which blinks the right 4 LEDS's (LED[3] will blink at about 1Hz, the 3 to the right of it will be correspondingly faster).

Congratulations!  You have F4PGA up and working on your machine.  

If the above did not work, contact a TA for help.  They can get you on the right path immediately.

Once you have this all working you are ready to test your own designs using the instructions in [Step3_Testing_Your_Own_Designs](Step3_Testing_Your_Own_Designs.md).   

IMPORTANT NOTE: if you have installed the tools in your own directory then you will need to make 1 change to the instructions in [Step3_Testing_Your_Own_Designs](Step3_Testing_Your_Own_Designs.md) when testing your own designs.  There, you will be instructed to execute the command:
```
export F4PGA_EXAMPLES_ROOT=/opt/f4pga
```

However, you should change that line to 
```
export F4PGA_EXAMPLES_ROOT=$HOME
```

This will point the system at your installation instead of the global installation.

That's it, now you can move on to [Step3_Testing_Your_Own_Designs](Step3_Testing_Your_Own_Designs.md).


