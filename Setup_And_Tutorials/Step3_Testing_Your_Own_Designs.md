# Testing Your Own Designs
Before you test your own designs you need to place the contents of [this script](collectFiles) into your home directory.  Put those contents into a file called `collectFiles`.  Do that now.  Make sure that it is executable.  You can change the permissions on it with a command like `chmod o+x ~/collectFiles` (do you remember that ~ refers to your home directory?).

## Preparing A Specific Lab
When you get ready to process one of your own designs, do the following:
1. Find the directory where your original project was.  Specifically look for the directory containing a file with a `.xpr` extension.  It might be something like `/home/myusername/EE220/Lab5` (and inside that directory there would be a `Lab5.xpr` file).  Make note of the entire path to that file as in: `/home/myusername/EE220/Lab5/Lab5.xpr`.  
2. Execute the `collectFiles` program like this: 
```
~/collectFiles /home/myusername/EE220/Lab5/Lab5.xpr /home/myusername/220-myusername/Labs/Lab5
```
Note that the first argument is the `.xpr` file you identified above.  And, the second argument is the directory name in your 220-myusername Labs directory you want created and where you want the files copied to. 
The script will create that directory if it doesn't exist.  It will then collect your design and XDC files as specified in the `.xpr` file and copy them into the directory it just created.

Take a minute to check to convince yourself that all the files got copied correctly over.

3. Now, create a file called `Makefile` in that directory (`/home/myusername/220-myusername/Labs/Lab5` for example).  Then, populate it with these contents and save it:
```
current_dir := ${CURDIR}
TARGET := basys3

# IMPORTANT: edit this next line if the name of your top level module is not 'top'
TOP := top

# IMPORTANT: edit this next line to specify the name of your .xdc file if different
XDC := ${current_dir}/basys3.xdc

# This next line will include all .v and .sv files in the current directory for compilation.
SOURCES := $(wildcard ${current_dir}/*.v ${current_dir}/*.sv)

# This actually does the compilation
include ${HOME}/symbiflow-examples/common/common.mk
```

Important: note that there is a variable called TOP in the Makefile which defines the name of your top-level module in your design.  Change that line to match your design before saving.

Also note that there is a variable called XDC which defines the name of your .xdc file - change that to match your file name.

Finally - there should be no testbench files in this directory.  All you should have are design .sv, .v, and .xdc files.  If any testbench .sv files were copied by the `collectFiles` program into this directory, delete them now.
## Running Symbiflow On Your Lab Files
Now you are ready to actually run Symbiflow on your lab files.
## Activate Your Environment
Execute the following commands:

```
export SYMBIFLOW_EXAMPLES_ROOT=$HOME
export INSTALL_DIR=$SYMBIFLOW_EXAMPLES_ROOT/opt/symbiflow
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
```

This will set up your environment needed to run the tools.  You need only do this one time each time you log in.  You can tell it has been done if you see an `(xc7)` to the left of the command prompt in your Linux command line shell.  This is a sign that the last step (running conda to activate the environment) has been run.

Also, you are going to do this each time you want to work with the Symbiflow tools.  A great way to make this easy to do is to do the following in your Linux home directory: (1) select and copy the above commands, (2) open a text editor and paste them into it, (3) save the with a name such as `sym.sh`.  

In the future any time you want to activate your environment you can then type `source sym.sh` and it will activate the environment and otherwise set things up to run Symbiflow.  And, if for some reason you want to de-activate the environment later you can do so by typing: `conda deactivate`.  
### Compile Your Design
Now you can compile your design by typing `make` inside the directory where your design files and your `Makefile` is.

If you have any problems at all, please capture all of the compilation output so we can debug it.  This whole process (compiling with Symbiflow) is not terribly difficult but there are enough steps that it is easy to get one wrong.  Also, note that we are maintaining a [work-arounds and answers page](../WorkArounds.md) which may contain things you need to do to get the tools to run.   

Go read the work-arounds page mentioned above right now.  If your design uses a clock, chances are that your `.xdc` file needs to be modified before Symbiflow will like it.

As with the testing above, as the tool runs it should be clear if there were errors in compilation by watching the text output.  If the tool runs successfully, here is what you will see for the last few lines of output:
```
...
Writing Implementation FASM: top.fasm
The entire flow of VPR took 14.593 seconds.
FASM extra: top_fasm_extra.fasm
writing final fasm
cd /auto/fsa/nelson/220-nelsobe/Labs/Lab5/build/basys3 && symbiflow_write_bitstream -d artix7 -f top.fasm -p xc7a35tcpg236-1 -b top.bit
Writing bitstream ...
```
If it doesn't end this way then there was an error and you need to look through the output for it.  Otherwise, there should be a .bit file in `build/basys3` which is the result of the run.  You can download this to the board using the download mechanism you used in class.  For example, if you are using Vivado to download you can just start it up, open the hardware manager, and then download the .bit file after navigating to it.  NOTE: you will not have a Vivado project or anything else from 220 when you do this - you are simply using Vivado as the board programming tool.

On the other hand, if the tool did not run successfully we are very interested in learning why.  If you get errors and a new .bit file is not created please get with one of the Symbiflow TA's to review the outcome.  It may be simply that you didn't create your Makefile correct or some other setup problem of yours.  We would like have the TA's help you figure this out so we don't report problems that really aren't the fault of Symbiflow.  If the TA can help you fix things so you get a working .bit file, great.  If not, that is OK.

## Documenting the Results of Your Tests
1. Regardless of whether the compilation gave errors, we want you to capture the output of the compilation using `make >& compile.log`.  Do this in the project directory.
2. Next, create a file in your project directory called `README.md`.  
3. If the bitstream worked on the board, your README.md file contents can be simple - just say that it compiled without errors and that the bitstream worked.
4. If the compilation gave an error, say so.  Then, pull the compilation error messages out of the compile.log file you just created and included them in the README.md file.  You can put verbatim text (like what you copy from the log) into the README.md file by placing three backquote characters on a line (the backquote is the on the same key as the tilde).  Then paste what you copied from log file into the README.md.  Then, put three backquote characters on a line.  That is a "code verbatim" block in markdown. 
5. Finally, save the README.md.

## Pushing Your Results Back Up to Github
1. Now, you need to tell git that you have a new directory of files that should be a part of the repository.  So, type: `git add .`.  This will tell git that you want this directory's contents to be a part of the repository.
2. Next, formally commit those files to git by typing: `git commit -am "Put a message here telling what you did for this commit".  Now, your project files are a part of git.
3. Next, add a tag to this version of the files by typing: `git tag -a Lab3` (or whatever this lab is called).  This will tell the TA that this is your final submission.
4. Finally, push these new files up to Github by typing: `git push`.

At this point this lab and its results are up at your Github page.  To be sure, go there in a web browser.  Click around and look at things.  If you click a directory such as `Lab3`, your README.md file contents will be the documentation that shows in the web browser.  Pretty slick.

As you look around, if you find that something is not right, you can always repeat the steps above (re-run, edit your README.md file, re-commit, re-tag, re-push).  When you do so and refresh your browser you should see the new contents.

That is it!  You have successfully completed one lab.  Hopefully future ones will go more quickly and you will be able to complete all of them.

# An Alternate Way To Program Your Board
Using Vivado's hardware manager works (and is familiar) and you are free to use it to program the board.  However, a program called `openocd` is installed on the lab Linux machines which is easier to run (and does NOT require you to open the Vivado GUI).  You should seriously consider using it instead.

Let's assume that I have just generated a file called mydesign.bit using Symbiflow.  To program the board with it I would do the following:

1. Copy these contents into a file called `7series.cfg` and save it:
```
interface ftdi
ftdi_device_desc "Digilent USB Device"
ftdi_vid_pid 0x0403 0x6010
# channel 1 does not have any functionality
ftdi_channel 0
# just TCK TDI TDO TMS, no reset
ftdi_layout_init 0x0088 0x008b
reset_config none
adapter_khz 10000

source [find cpld/xilinx-xc7.cfg]
source [find cpld/jtagspi.cfg]
init

puts [irscan xc7.tap 0x09]

set xc7a35t "0362D093"
set xc7a100t "13631093"
set code [drscan xc7.tap 32 0]  
puts $code

if { $code == $xc7a35t} {
    puts "The board has an xc7a35t"
}

if { $code == $xc7a100t} {
    puts "The board has an xc7a100t"
}

puts "Programming..."
pld load 0 top.bit
exit
```

2. Edit the next-to-last line to reflect the actual name of the .bit file you want to program to the board.

3. Execute the following from the command line in Linux:
```
openocd -f 7series.cfg
```

This will program the board with the .bit file mentioned on the next-to-last line.  If it works, you will see something like this on your terminal screen:
```
Open On-Chip Debugger 0.10.0
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
none separate
adapter speed: 10000 kHz
Info : auto-selecting first available session transport "jtag". To override use 'transport select <transport>'.
Info : ftdi: if you experience problems at higher adapter clocks, try the command "ftdi_tdo_sample_edge falling"
Info : clock speed 10000 kHz
Info : JTAG tap: xc7.tap tap/device found: 0x0362d093 (mfg: 0x049 (Xilinx), part: 0x362d, ver: 0x0)
```
You will then see output stating that it programmed the board successfully.

That's it - it is that simple (way easier than firing up Vivado and you can do it all with the command line).
