# Step 2

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

If you don't understand this or want some help, check with a TA for help.

## 1.1 Preparing A Specific Lab
When you get ready to process one of your own designs, there are two ways to proceed.  In either case you need to collect all the files that were a part of your original design and place them into a directory such as `~/220-myusername/Labs/Lab5`.

### 1.1.1 Using the .xpr File to Help Collect Your Files
If you still have the .xpr file from your Vivado project (you will have it unless you explicitly have deleted it), you can do the following:
1. Find the directory where your original project was.  Specifically look for the directory containing a file with a `.xpr` extension.  It might be something like `~/EE220/Lab5` (and inside that directory there would be a `Lab5.xpr` file).  Make note of the entire path to that file as in: `~/EE220/Lab5/Lab5.xpr`.  
2. Execute the `collectFiles` program like this: 
```
collectFiles ~/EE220/Lab5/Lab5.xpr ~/220-myusername/Labs/Lab5
```
Note:`~` is shorthand for your home directory.

The first argument when you run the program is the `.xpr` file you identified above.  The second argument is the directory name in your 220-myusername Labs directory where
you want the files copied to.   This will be the directory where you eventually compile and test your designs.

The script will then collect your design and XDC files as specified in the `.xpr` file and copy them into the directory it just created.
It will also create a `Makefile` there for you.  Note: if the destination directory exists it will fail and tell you to delete the destination directory and try again.

### 1.1.2 Manually Collecting Your Files
If you don't have your .xpr file, you will need to find the needed project files and copy them into a directory in your repo (`~/220-myusername/Labs/Lab5` for example).  The files you will need include anything required to build the project and would be:
- All the SystemVerilog and Verilog files you used (do NOT include testbench files)
- Your .xdc file
- A copy of the Makefile in `~/220-myusername/Setup_And_Tutorials/bin/Makefile`

So, (a) create a specific directory for the lab (like `~/220-myusername/Labs/Lab5`) and (b) find those and copy all the above files into that directory.  NOTE: they cannot be inside subdirectories - they all need to be together in that directory for F4PGA to find them.

### 1.1.3 Editing Your Makefile
Now, go to your lab directory (`cd ~/220-myusername/Labs/Lab5`) and take a minute to check to convince yourself that all the files you need are there.  Also, look to see if any testbench files (the ones provided by the professor to help test your circuit) are there.  If there are testbench files, delete them now using `rm`. For example,  `rm debounce_tb.v`.



## 1.2 Running F4PGA On Your Lab Files
Now you are ready to actually run F4PGA on your lab files.

### 1.2.1 Activate Your Environment
Execute the following commands:

```
export F4PGA_EXAMPLES_ROOT=/opt/f4pga
export INSTALL_DIR=$F4PGA_EXAMPLES_ROOT/opt/f4pga
FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate $FPGA_FAM
echo "Environment activated"

```
This will set up your environment needed to run the tools.  You need only do this once time each time you log in.  You can tell it has been done if you see an `(xc7)` to the left of the command prompt in your Linux command line shell.  This is a sign that the last step (running conda to activate the environment) has been run.

Also, you are going to do this each time you want to work with the F4PGA tools.  A great way to make this easy to do is to do the following in your Linux home directory: (1) select and copy the above commands, (2) open a text editor and paste them into it, (3) save the with a name such as `f4pga.sh`.  

In the future any time you want to activate your environment you can then type `source f4pga.sh` and it will activate the environment and otherwise set things up to run F4PGA.  And, if for some reason you want to de-activate the environment later you can do so by typing: `conda deactivate`. If this confused you ask a TA for help setting up your `f4pga.sh` environment. 

NOTE: Back in [Step2_Installing_Testing](Step2_Installing_Testing.md) you were given the option to install the tools into your own directory rather than use the system-installed version.  If you did that then you will change the first line above to point to the where you installed the tools rather than `/opt/f4pga`.

## 2 Using f4pga_student.py

To make your life easier, we have written a python script to allow you to think less.
This script is contained in the `bin` folder.

After you have collected all your files and activated your environmen, in the commmand line go to the Lab you have prepared. Make sure it is named`Lab#` for example, `Lab8`. 

Now run the command `python3 f4pga_student.py --lab #` NOTE: This expects that you added the bin folder to your paths when setting up `collectFiles`

What this script will do:
1. Check to see if you have all the files for a certain lab. If your files aren't named properly, an error will be thrown.
2. Check to make sure you're conda environment is running, if it isn't, an error will be thrown
3. Set up your `Makefile` for you. Make sure you used the correct name for your top module in your code.
4. Run `make` and `make download` to first compile the design and download it to your board.
NOTE: If your board isn't plugged in and on when you run this, it won't download. You can just run it again afterwards and it will work.
5. Collect any errors from the compilation
6. Ask you questions to create a `Readme.md` quickly
7. Do `git add`, `git commit` and `git push`

### 2.1 Arguments of this script
This script accepts different command line arguments allowing you to do things piecemeal. 

`--git`/`-g` : If you run this command it will only do a `git add`, `git commit` and a `git push`  
`--download`/`-d` : If you run this command it will only download the bitstream to the board and will recompile any element that has been changed since the last compilation  
`--ignore`/`-i` : Warnings about the Conda environment and about missing files will be ignored.   
`--readme`/`-r` : This will only ask you the questions to create a `Readme.md`  

### 2.2 What About If It Doesn't Work?
This whole process (compiling with F4PGA) is not terribly difficult but there are enough steps that it is easy to get one wrong.  

If you get error messages, they might be a bit cryptic (no surprise).  
Your error messages will be stored in a `.txt` file named `errorlog.txt`

We are maintaining a [work-arounds and answers page](../WorkArounds.md) which may contain things you need to do to get the tools to run on your design.   
Go read the work-arounds page mentioned above right now.  For example: if your design uses a clock, chances are that your `.xdc` file needs to be modified before F4PGA will like it.

If you still have problems, message an F4PGA TA and talk through what has happened.  If the TA can help you and you get a good run with a working .bit file then great!  Even so, in the little writeup you do (see below) we would like to know what went wrong, even if it was your mistake.  Maybe we can fix the documentation to make it more clear.  Or, maybe there was a real problem and you had to tinker with your design to get it to work.  Either way we would like to know!

NOTE: We DO NOT expect you to be making changes to your design to make it work.  If it is legal SystemVerilog and fails in F4PGA that is sufficient information to provide us.  But, if the error message gives you a hint of what might be wrong and you fix it and it works, that would be great feedback for you to provide.  Just realize that is not the expectation.
