# Step 3

# 1. Testing Your Own Designs
As you test your own designs you are going to need to run a program called `collectFiles` which is in your Linux repo (in the directory `~/220-myusername/Setup_And_Tutorials/bin`).  It will be easiest to use this program if you can run it without having to specify the whole path every time you run it.  To add it to your Linux search path (so you can run it without typing its name), edit the file `~/.bashrc` and add this line to the bottom:
```
export PATH=~/220-myusername/Setup_And_Tutorials/bin:$PATH
```
You may also need to go into that directory and make sure the file is executable by doing this: `chmod u+x collectFiles`.  

Now, kill your command line and restart a new one.  You can tell if this worked when, if you type: `collectFiles` you get a usage message in return, telling you want command line arguments to provide:
```
usage: collectFiles [-h] [--verbose] xprFile destinationDirectory
collectFiles: error: the following arguments are required: xprFile, destinationDirectory
```

If you don't get this, check with a Symbiflow TA for help.

## 1.1 Preparing A Specific Lab
When you get ready to process one of your own designs, there are two ways to proceed.  In either case you need to collect all the files that were a part of your original design and place them into a directory such as `~/220-myusername/Labs/Lab5`.

### 1.1.1 Using the .xpr File to Help Collect Your Files
If you still have the .xpr file from your Vivado project (yuou will have it unless you explicitly have deleted it), you can do the following:
1. Find the directory where your original project was.  Specifically look for the directory containing a file with a `.xpr` extension.  It might be something like `~/EE220/Lab5` (and inside that directory there would be a `Lab5.xpr` file).  Make note of the entire path to that file as in: `~/EE220/Lab5/Lab5.xpr`.  
2. Execute the `collectFiles` program like this: 
```
collectFiles ~/EE220/Lab5/Lab5.xpr ~/220-myusername/Labs/Lab5
```
Note that `~` is shorthand for your home directory.

The first argument when you run the program is the `.xpr` file you identified above.  The second argument is the directory name in your 220-myusername Labs directory where
you want the files copied to.   This will be the directory where you eventually compile and test your designs.

The script will then collect your design and XDC files as specified in the `.xpr` file and copy them into the directory it just created.
It will also create a `Makefile` there for you.  Note: if the destination directory exists it will fail and tell you to delete the destination directory and try again.

### 1.1.2 Manually Collecting Your Files
If you don't have your .xpr file, you will need to find the needed project files and copy them into a directory in your repo (`~/220-myusername/Labs/Lab5` for example).  The files you will need include anything required to build the project and would be:
- All the SystemVerilog and Verilog files you used (do NOT include testbench files)
- Your .xdc file
- A copy of the Makefile in `~/220-myusername/Setup_And_Tutorials/bin/Makefile`

So, (a) create a specific directory for the lab (like `~/220-myusername/Labs/Lab5`) and (b) find those and copy all the above files into that directory.  NOTE: they cannot be inside subdirectories - they all need to be together in that directory for Symbiflow to find them.

### 1.1.3 Editing Your Makefile
Now, go to your lab directory (`cd ~/220-myusername/Labs/Lab5`) and take a minute to check to convince yourself that all the files you need are there.  Also, look to see if any testbench files (the ones provided by the professor to help test your circuit) are there.  If there are testbench files, delete them now using `rm`.

Now open up the file there called `Makefile` and edit it.
There is a variable called TOP in the Makefile which defines the name of your top-level **module** in your design.  Change that line to match your design's top level module before saving.  NOTE: this is NOT a file name, it is the name of the top level ***module*** in your design hierarchy.

Also note that there is a variable called XDC which defines the name of your .xdc **file** - change that to match your XDC file name.

## 1.2 Running Symbiflow On Your Lab Files
Now you are ready to actually run Symbiflow on your lab files.

### 1.2.1 Activate Your Environment
Execute the following commands:

```
export F4PGA_EXAMPLES_ROOT=/opt/symbiflow
export INSTALL_DIR=$F4PGA_EXAMPLES_ROOT/opt/f4pga
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
echo "Environment activated"

```

This will set up your environment needed to run the tools.  You need only do this one time each time you log in.  You can tell it has been done if you see an `(xc7)` to the left of the command prompt in your Linux command line shell.  This is a sign that the last step (running conda to activate the environment) has been run.

Also, you are going to do this each time you want to work with the Symbiflow tools.  A great way to make this easy to do is to do the following in your Linux home directory: (1) select and copy the above commands, (2) open a text editor and paste them into it, (3) save the with a name such as `sym.sh`.  

In the future any time you want to activate your environment you can then type `source sym.sh` and it will activate the environment and otherwise set things up to run Symbiflow.  And, if for some reason you want to de-activate the environment later you can do so by typing: `conda deactivate`.  

NOTE: Back in [Step2_Installing_Testing](Step2_Installing_Testing.md) you were given the option to install the tools into your own directory rather than use the system-installed version.  If you did that then you will change the first line above to point to the where you installed the tools rather than `/opt/symbiflow`.

### 1.2.2 Compile Your Design
Now you can compile your design by typing `make clean` followed by `make` inside the directory where your design files and your `Makefile` is.  This will run with the Yosys front end.

To run with the alternate Surelog front end type the following: `SURELOG_CMD="-parse -DSYNTHESIS" make` instead.

Regardless of whether you have any problems at all, please eventually capture all of the compilation output so we can debug it (you will be told how to capture the compilation output below).  

### 1.2.3 What If It Works?
If the tool runs successfully, here is what you will see for the last few lines of output:
```
...
Writing Implementation FASM: top.fasm
The entire flow of VPR took 14.593 seconds.
FASM extra: top_fasm_extra.fasm
writing final fasm
cd /auto/fsa/nelson/220-nelsobe/Labs/Lab5/build/basys3 && symbiflow_write_bitstream -d artix7 -f top.fasm -p xc7a35tcpg236-1 -b top.bit
Writing bitstream ...
```
There should be a .bit file in `build/basys3` which is the result of the run.  You can download this to the board using the download mechanism you used in class.  For example, if you are using Vivado to download you can just start it up, open the hardware manager, and then download the .bit file after navigating to it.  NOTE: you will not have a Vivado project or anything else from 220 when you do this - you are simply using Vivado as the board programming tool

### 1.2.4 What About If It Doesn't Work?
This whole process (compiling with Symbiflow) is not terribly difficult but there are enough steps that it is easy to get one wrong.  

If you get error messages, they might be a bit cryptic (no surprise).  

We are maintaining a [work-arounds and answers page](../WorkArounds.md) which may contain things you need to do to get the tools to run on your design.   
Go read the work-arounds page mentioned above right now.  For example: if your design uses a clock, chances are that your `.xdc` file needs to be modified before Symbiflow will like it.

If you still have problems, make an appointment with a Symbiflow TA and talk through what has happened.  If the TA can help you and you get a good run with a working .bit file then great!  Even so, in the little writeup you do (see below) we would like to know what went wrong, even if it was your mistake.  Maybe we can fix the documentation to make it more clear.  Or, maybe there was a real problem and you had to tinker with your design to get it to work.  Either way we would like to know!

NOTE: we DO NOT expect you to be making changes to your design to make it work.  If it is legal SystemVerilog and fails in Symbiflow that is sufficient information to provide us.  But, if the error message gives you a hint of what might be wrong and you fix it and it works, that would be great feedback for you to provide.  Just realize that is not the expectation.

## 1.3 A Micro-Tutorial on `make`
The `Makefile` you edited above is part of a build system that knows about the dependencies between your source files and the final .bit file.  Every time you change one of your source files and type `make` it realizes that the "recipe" for your .bit file needs to be re-run because one of the ingredients has changed.  So, what happens if you run `make` and it succeeds in making a .bit file and then you want to run it from scratch again (to capture the output to a log file, for example)?   If you type `make` again it will says that everything is up to date and the recipe doesn't need to be re-run.  

To remove the previous build results so you can force a re-run you can type `make clean` and this will remove the compilation results.  Then, a subsequent `make` will do a full re-run from scratch.

## 1.4 Documenting the Results of Your Tests
1. Regardless of whether the compilation gave errors, we want you to capture the output of the compilation using `make >& compile.log`.  You should do a `make clean` first to remove the previous results so when you re-run using `make >& compile.log` it will do the full compile process.  Otherwise, you will simply get a message that everything was up to date - not very useful.
2. After you have captured a `compile.log` file, next create a file in your project directory called `README.md`.  This is where you will report your design's success or failure.  To do so, copy the contents of the file `TemplateREADME.md` file in your own repo and use them as the starting point for this `README.md` file.  
3. Fill out this file as your 'report'.
4. Finally, save the `README.md`. 

## 1.5 Pushing Your Results Back Up to Github
1. Now, you need to tell git that you have a new directory of files that should be a part of the repository.  So, type: `git add ~/220-myusername/Labs/Lab4`, filling in the real directory name.  This will tell git that you want this directory's contents to be a part of the repository.
2. Next, formally commit those files to git by typing: `git commit -am "Put a message here telling what you did for this commit"`.  Now, your project files are a part of git.   The message you include can be as simple as "Committing files for my Lab4" or "Re-committing files for my Lab4 because I did it wrong first try".
3. Finally, push these new files up to Github by typing: `git push`.

At this point your lab and results are now up on the web at your Github page.  To be sure, go there in a web browser (you need to go clear back to where you created your repo to get the address).  Click around and look at things.  If you click a directory such as `Lab3`, your README.md file contents will be the documentation that shows in the web browser.  Pretty slick.

As you look around, if you find that something is not right, you can always repeat the steps above (re-run, edit your README.md file, re-commit, re-push).  When you do so and refresh your browser you should see the new contents.

That is it!  You have successfully completed one lab.  Hopefully future ones will go more quickly and you will be able to complete all of them in short order.

# 2. An Alternate Way To Program Your Board
Using Vivado's hardware manager works (and is familiar) and you are free to use it to program the board.  However, a program called `openocd` is installed on the lab Linux machines which is  easier to run (and does not require you to open the Vivado GUI).  You should seriously consider using it instead.

Let's assume that I have just generated a bitstream file called `mydesign.bit` using Symbiflow and that I have put the `mydesign.bit` file into a directory.  To program the board with it I would do the following:

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

