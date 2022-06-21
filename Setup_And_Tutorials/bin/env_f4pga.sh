export F4PGA_EXAMPLES_ROOT=/opt/f4pga
export INSTALL_DIR=$F4PGA_EXAMPLES_ROOT/opt/f4pga
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
echo "Environment activated"
