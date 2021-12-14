# Symbiflow Installation/Testing Instructions 
To use the Symbiflow tools you will need to install the toolchain in your own directory.  
- It will install into your personal CAEDM space and so will be accessible from any of the 220 Lab computers.
- The installation will require about 3GB of space in your user space.

## Installation script
Copy and paste the following commands into a bash terminal on one of the digital machines.  Note that you can do all of this while either (a) being in the lab physically on one of the digital lab computers or (b) while being remotely logged in over the network.

First, you need to decide where you intend on installing the software.  The default is in your home directory so execute this ($HOME is a Linux environment variable which points to your home directory when you log in):

```
export SYMBIFLOW_EXAMPLES_ROOT=$HOME
```

This command sets a new environment variable to specify where `symbiflow-examples` will be installed.  If you don't want it in your home directory, you can change that command above and then everything below will reflect that locatiuon.

Now, with that environment variable set you can go ahead and install everything by copying and pasting these commands:

```
cd $SYMBIFLOW_EXAMPLES_ROOT
git clone https://github.com/SymbiFlow/symbiflow-examples.git
cd symbiflow-examples

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_installer.sh

export INSTALL_DIR=$SYMBIFLOW_EXAMPLES_ROOT/opt/symbiflow

export FPGA_FAM=xc7

bash conda_installer.sh -u -b -p $INSTALL_DIR/$FPGA_FAM/conda;
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh";
conda env create -f $FPGA_FAM/environment.yml

mkdir -p $INSTALL_DIR/xc7/install
wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/459/20211116-000105/symbiflow-arch-defs-install-ef6fff3c.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/459/20211116-000105/symbiflow-arch-defs-xc7a50t_test-ef6fff3c.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
```

## Running a Test Design
There is a test counter design provided which you can build to test whether the toolchain is installed correctly.  

You can build it using the following commands.  Note that the first line needs to point to where you installed everything above.  If you didn't change the very first line above for where the install happened you can leave it as-is.  Otherwise, you need to change the first line below to match where you installed it.

```
export SYMBIFLOW_EXAMPLES_ROOT=$HOME
export INSTALL_DIR=$SYMBIFLOW_EXAMPLES_ROOT/opt/symbiflow
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
cd $SYMBIFLOW_EXAMPLES_ROOT/symbiflow-examples/xc7
rm -rf counter_test/build
TARGET="basys3" make -C counter_test
conda deactivate
```

If all worked, the last part of the terminal text should be something like this:

```
...
The entire flow of VPR took 16.4372 seconds.
FASM extra: top_fasm_extra.fasm
writing final fasm
cd /home/nelson/symbiflow-examples/xc7/counter_test/build/basys3 && symbiflow_write_bitstream -d artix7 -f top.fasm -p xc7a35tcpg236-1 -b top.bit
Writing bitstream ...
make: Leaving directory '/home/nelson/symbiflow-examples/xc7/counter_test'
```

In addition, you should have a .bit file in directory: `$HOME/symbiflow-examples/xc7/counter_test/build/basys3/top.bit` which you can use to program your board. 

## Running Your Own Design
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
