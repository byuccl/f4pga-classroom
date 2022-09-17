export F4PGA_EXAMPLES_ROOT=/opt/f4pga
export F4PGA_INSTALL_DIR=/opt/f4pga
FPGA_FAM="xc7"
export PATH="$F4PGA_INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
