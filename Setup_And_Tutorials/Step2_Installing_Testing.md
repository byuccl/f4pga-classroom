# 1. Step 2 - Symbiflow Installation/Testing Instructions 
To use the Symbiflow tools you will need to install the toolchain in your own directory.  
- It will install into your personal CAEDM space and so will be accessible from any of the 220 Lab computers.
- The installation will require about 3GB of space in your user space.


Again, if you have any problems at all in the steps below, contact one of the Symbiflow TA's for help.
## 1.1 Installation script
Copy and paste the following commands into the terminal on one of the digital lab Linux machines.  Note that you can do all of this while either (a) being in the lab physically on one of the digital lab computers or (b) while being remotely logged in over the network:

```
export SYMBIFLOW_EXAMPLES_ROOT=$HOME
cd $SYMBIFLOW_EXAMPLES_ROOT
# Note we are cloning BYUCCL's fork
git clone https://github.com/byuccl/symbiflow-examples.git
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
echo "Installation complete..."

```

This will have created two directories in your home directory.  The first is called `opt` and the second is called `symbiflow-examples`.  You need not necessarily do anything with them but you need to leave them there - they are the Symbiflow tools installation.

## 1.2 Running a Test Design
There is a test counter design provided with Symbiflow which you can build to test whether the toolchain is installed correctly.  

You can build it using the following commands:

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

If it all worked, the last part of the terminal text should be something like this:

```
...
The entire flow of VPR took 16.4372 seconds.
FASM extra: top_fasm_extra.fasm
writing final fasm
cd /home/nelson/symbiflow-examples/xc7/counter_test/build/basys3 && symbiflow_write_bitstream -d artix7 -f top.fasm -p xc7a35tcpg236-1 -b top.bit
Writing bitstream ...
make: Leaving directory '/home/nelson/symbiflow-examples/xc7/counter_test'
```

In addition, you should have a .bit file in directory: `$HOME/symbiflow-examples/xc7/counter_test/build/basys3/top.bit` which you can use to program your board. It is a simple counter which blinks the right 4 LEDS's (LED[3] will blink at about 1Hz, the 3 to the right of it will be correspondingly faster).

Congratulations!  You have Symbiflow up and working on your machine.  

If the above did not work, contact a Symbiflow TA for help.  They can get you on the right path immediately.

Once you have this all working you are ready to test your own designs using the instructions in [Step3_Testing_Your_Own_Designs](Step3_Testing_Your_Own_Designs.md).
