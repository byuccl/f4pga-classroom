
# Bin  

## **readme.py**  

This simple script will make it easier for you to create your  `README.md` for each lab.

To use run the command `python3 ~/220-myusername/bin/readme.py` in a Linux terminal while inside the individual lab folder you want to create a README.md for

The first argument `python3` tells the terminal we are launching a python program.  
The `~/f4pga-class-testing/bin/readme.py` tells the terminal where the program is. You will have to change this to your username and install path.  

Then type in responses to the prompts. Pressing enter will submit the response.  

### Notes  

- You can paste in command line with `CTRL + SHIFT + V` and copy with `CTR + SHIFT + C`
- If you end the program with `CTRL+C` or by closing the window, it will not save your progress.  
- If you run it again, it will overwrite the previous `README.md` file.  
- You can leave answers blank by pressing enter.  
- Upper case YES means its default, just press enter for yes.  

## **collectFiles**  

As you test your own designs you are going to need to run a program called `collectFiles` which is in your Linux repo (in the directory `~/220-myusername/ Setup_And_Tutorials/bin)`. It will be easiest to use this program if you can run it without having to specify the whole path every time you run it. To add it to your Linux search path (so you can run it without typing its name), edit the file `~/.bashrc` and add this line to the bottom:

`export PATH=~/220-myusername/Setup_And_Tutorials/bin:$PATH`

You may also need to go into that directory and make sure the file is executable by doing this: `chmod u+x collectFiles.`

Now, kill your command line and restart a new one. You can tell if this worked when, if you type: `collectFiles` you get a usage message in return, telling you want command line arguments to provide:

`usage: collectFiles [-h] [--verbose] xprFile destinationDirectory`  
`collectFiles: error: the following arguments are required: xprFile, destinationDirectory`


When you get ready to process one of your own designs, there are two ways to proceed.  In either case you need to collect all the files that were a part of your original design and place them into a directory such as `~/220-myusername/Labs/Lab5`.

### Using the .xpr File to Help Collect Your Files  

If you still have the .xpr file from your Vivado project (you will have it unless you explicitly have deleted it), you can do the following:

1. Find the directory where your original project was.  Specifically look for the directory containing a file with a `.xpr` extension.  It might be something like `~/EE220/Lab5` (and inside that directory there would be a `Lab5.xpr` file).  Make note of the entire path to that file as in: `~/EE220/Lab5/Lab5.xpr`.  

2. Execute the `collectFiles` program like this:  
``` collectFiles ~/EE220/Lab5/Lab5.xpr ~/220-myusername/Labs/Lab5 ```

Note that `~` is shorthand for your home directory.

The first argument when you run the program is the `.xpr` file you identified above.  The second argument is the directory name in your 220-myusername Labs directory where
you want the files copied to.   This will be the directory where you eventually compile and test your designs.

The script will then collect your design and XDC files as specified in the `.xpr` file and copy them into the directory it just created.
It will also create a `Makefile` there for you.  Note: if the destination directory exists it will fail and tell you to delete the destination directory and try again.

### Editing Your Makefile  

Now, go to your lab directory (`cd ~/220-myusername/Labs/Lab5`) and take a minute to check to convince yourself that all the files you need are there.  Also, look to see if any testbench files (the ones provided by the professor to help test your circuit) are there.  If there are testbench files, delete them now using `rm`.

Now open up the file there called `Makefile` and edit it.
There is a variable called TOP in the Makefile which defines the name of your top-level **module** in your design.  Change that line to match your design's top level module before saving.  NOTE: this is NOT a file name, it is the name of the top level ***module*** in your design hierarchy.

## **Makefile**

The `Makefile` tells F4PGA how to build and compile your board.  

- Target: Specifies the type of board. We use the basys3.  
- TOP: Specifies the name of the top module of your project.  This will need to be changed each time.  
- XDC: Specifies the name of the XDC constraints file to be used.  
- SOURCES: Specifies which .sv and .v files will be used.
- Include: Includes the master make file which calls the different tools to make a bitsream
