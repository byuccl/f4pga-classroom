# Testing Your Own Designs
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

## Preparing A Specific Lab
When you get ready to process one of your own designs, do the following:
1. Find the directory where your original project was.  Specifically look for the directory containing a file with a `.xpr` extension.  It might be something like `/home/myusername/EE220/Lab5` (and inside that directory there would be a `Lab5.xpr` file).  Make note of the entire path to that file as in: `/home/myusername/EE220/Lab5/Lab5.xpr`.  
2. Execute the `collectFiles` program like this: 
```
collectFiles /home/myusername/EE220/Lab5/Lab5.xpr /home/myusername/220-myusername/Labs/Lab5
```
Note that you can substitute `~` for `/home/myusername` in any of these commands to save typing.

The first argument when you run the program is the `.xpr` file you identified above.  The second argument is the directory name in your 220-myusername Labs directory where
you want the files copied to.   This will be the directory where you eventually compile and test your designs.

The script will then collect your design and XDC files as specified in the `.xpr` file and copy them into the directory it just created.
It will also create a `Makefile` there for you.  Note: if the destination directory exists it will fail and tell you to delete the destination directory and try again.

3. Now, go to that destination directory (`cd ~/220-myusername/Labs/Lab5`).  Take a minute to check to convince yourself that all the files got copied correctly over.  Also, look to see if any testbench files (the ones provided by the professor to help test your circuit) got copied overl  If they did, delete them now using `rm`.
4. Now open up the file there called `Makefile` and edit it.
There is a variable called TOP in the Makefile which defines the name of your top-level **module** in your design.  Change that line to match your design's top level module before saving.
5. Also note that there is a variable called XDC which defines the name of your .xdc **file** - change that to match your file name.
6. Finally - as mentioned above, there should be no testbench files in this directory.  All you should have are your design files (.sv and .v files) and your constraint file (.xdc file).  If any testbench .sv files were copied by the `collectFiles` program into this directory, delete them now.

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
echo "Environment activated"

```

This will set up your environment needed to run the tools.  You need only do this one time each time you log in.  You can tell it has been done if you see an `(xc7)` to the left of the command prompt in your Linux command line shell.  This is a sign that the last step (running conda to activate the environment) has been run.

Also, you are going to do this each time you want to work with the Symbiflow tools.  A great way to make this easy to do is to do the following in your Linux home directory: (1) select and copy the above commands, (2) open a text editor and paste them into it, (3) save the with a name such as `sym.sh`.  

In the future any time you want to activate your environment you can then type `source sym.sh` and it will activate the environment and otherwise set things up to run Symbiflow.  And, if for some reason you want to de-activate the environment later you can do so by typing: `conda deactivate`.  

### Compile Your Design
Now you can compile your design by typing `make` inside the directory where your design files and your `Makefile` is.

Regardless of whether you have any problems at all, please eventually capture all of the compilation output so we can debug it (you will be told how to capture the compilation output below).  

### What If It Works?
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

### What About If It Doesn't Work?
This whole process (compiling with Symbiflow) is not terribly difficult but there are enough steps that it is easy to get one wrong.  

If you get error messages, they might be a bit cryptic (no surprise).  

We are maintaining a [work-arounds and answers page](../WorkArounds.md) which may contain things you need to do to get the tools to run on your design.   
Go read the work-arounds page mentioned above right now.  For example: if your design uses a clock, chances are that your `.xdc` file needs to be modified before Symbiflow will like it.

If you still have problems, make an appointment with a Symbiflow TA and talk through what has happened.  If the TA can help you and you get a good run with a working .bit file then great!  Even so, in the little writeup you do (see below) we would like to know what went wrong, even if it was your mistake.  Maybe we can fix the documentation to make it more clear.  Or, maybe there was a real problem and you had to tinker with your design to get it to work.  Either way we would like to know!

NOTE: we DO NOT expect you to be making changes to your design to make it work.  If it is legal SystemVerilog and fails in Symbiflow that is sufficient information to provide us.  But, if the error message gives you a hint of what might be wrong and you fix it and it works, that would be great feedback for you to provide.  Just realize that is not the expectation.

### A Micro-Tutorial on `make`
The `Makefile` you edited above is part of a build system that knows about the dependencies between your source files and the final .bit file.  Every time you change one of your source files and type `make` it realizes that the "recipe" for your .bit file needs to be re-run because one of the ingredients has changed.  So, what happens if you run `make` and it succeeds in making a .bit file and then you want to run it from scratch again (to capture the output to a log file, for example)?   If you type `make` again it will says that everything is up to date and the recipe doesn't need to be re-run.  

To remove the previous build results so you can force a re-run you can type `make clean` and this will remove the compilation results.  Then, a subsequent `make` will do a full re-run from scratch.

## Documenting the Results of Your Tests
1. Regardless of whether the compilation gave errors, we want you to capture the output of the compilation using `make >& compile.log`.  You should do a `make clean` first to remove the previous results so when you re-run using `make >& compile.log` it will do the full compile process.  Otherwise, you will simply get a message that everything was up to date - not very useful.
2. After you have captured a `compile.log` file, next create a file in your project directory called `README.md`.  This is where you will report your design's success or failure.
3. If the bitstream worked on the board, your README.md file contents can be simple - just say that it compiled without errors and that the bitstream worked.
4. If the compilation gave an error, say so.  Then, pull the compilation error messages out of the `compile.log` file you just created and include them in the `README.md` file.  By the way, you can put verbatim text (like what you copy from the log) into the `README.md` file by placing three backquote characters on a line (the backquote is the on the same key as the tilde).  Then paste what you copied from log file into the `README.md`.  Then, put three backquote characters on a line to close the block.  That is a "code verbatim" block in markdown. (It is how all the code sample sections have been created in these instructions).  In fact, if you want to learn how to add sectioning or numbered lists or whatever, just open up any `.md` file in your repo and learn by example...
5. Finally, save the `README.md`. 

## Pushing Your Results Back Up to Github
1. Now, you need to tell git that you have a new directory of files that should be a part of the repository.  So, type: `git add ~/220-myusername/Labs/Lab4`, filling in the real directory name.  This will tell git that you want this directory's contents to be a part of the repository.
2. Next, formally commit those files to git by typing: `git commit -am "Put a message here telling what you did for this commit"`.  Now, your project files are a part of git.   The message you include can be as simple as "Committing files for my Lab4" or "Re-committing files for my Lab4 because I did it wrong first try".
3. Finally, push these new files up to Github by typing: `git push`.

At this point your lab and results are now up on the web at your Github page.  To be sure, go there in a web browser (you need to go clear back to where you created your repo to get the address).  Click around and look at things.  If you click a directory such as `Lab3`, your README.md file contents will be the documentation that shows in the web browser.  Pretty slick.

As you look around, if you find that something is not right, you can always repeat the steps above (re-run, edit your README.md file, re-commit, re-push).  When you do so and refresh your browser you should see the new contents.

That is it!  You have successfully completed one lab.  Hopefully future ones will go more quickly and you will be able to complete all of them in short order.

# An Alternate Way To Program Your Board
Using Vivado's hardware manager works (and is familiar) and you are free to use it to program the board.  However, a program called `openocd` is installed on the lab Linux machines which is MUCH easier to run (and does NOT require you to open the Vivado GUI).  You should seriously consider using it instead.

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

# Updating Your Repos
There may be times when changes are made to either the repo you initialized your own repo's contents with and you are instructed to update your repo to match.  Alternatively, there may be times when you are instructed to update your `symbiflow-examples` repo with new contents.  This section tells how to do this.  Remember - you only need to do this when instructed to do so.

## Updating Your Own Repo
Remember that when you created your own repo you initialized it with the contents of the `https://github.com/byuccl/symbiflow-class-testing`?  That repo contains all this documentation and a number of other files.  Then, remember up above that we had you do the following: `git remote add starterDirectory https://github.com/byuccl/symbiflow-class-testing`?  That command was to set things up so that you can update your repo in Linux with new contents if these instructions are updated.  To do an update when instructed to do so, it is as simple as:`git pull starterDirectory main`.  When you do this you will get any changes we made to the starting repo documentation or other files in case they get changed later...

## Updating Your Copy of symbiflow-examples
There may be times when you are instructed to update your copy of `symbiflow-examples`.  If you recall you installed that into your home directory.  To update that you would `cd ~/symbiflow-examples` and then `git pull`.  

