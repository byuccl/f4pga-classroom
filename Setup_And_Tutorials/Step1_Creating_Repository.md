You should print this page of instructions or take a screenshot of it before you start so you have them to refer you to.

# Overview
This semester as you test your designs using the Symbiflow tools you are going to be doing that in a `git` repository on your Linux machine.  However, that local repository will be tied to one at https://github.com.   This is shown in this figure:

<img src="media/Overview.png" width="600"/>

The top box is the Github Repository you will create in the first couple of steps below.  After that, you will *clone* it onto a BYU Linux machine.  The instructions for doing these steps so make up the rest of this document.   Doing this will take about 15 minutes.   This is the first of 3 steps you needs to complete.

Once you have your repository on the lab Linux machines, you will need to download and install the Symbiflow tools in Linux.  Completing it will take about 30 minutes.

Once these two steps are done you can test your first design using Symbiflow. The way you will do this is you will copy your design files from your passed-off lab (meaning it all worked in Vivado) into a directory in your local repository.  You will then re-compile and test it using the Symbiflow tools in that repository.  You will then write up a short (1-2 paragraph) summary of how well it worked and copy that summary and your design files back up to your Github repository and the TA's will then collect that information as a part of our research study.

All along the way there will be TA's helping you.  These are not the normal course TA's but rather are TA's hired specifically for this research study using Symbiflow.  They will be able to help you set everything up, test it to make sure it is working, and then test your designs using the Symbiflow tools.  So, don't be nervous - there will be multiple people ready and available when you have questions.

# Getting Started
To get started and do the needed setup, follow the instructions in the rest of this document.  But, before you start, please open a file on your computer somewhere and, in it, record any problems you have as you work through all this this semester.  Those notes will be helpful to us later to understand what is lacking in documentation or needs better explanation.

At the current time, the lab machines do not have a lot of virtual memory (swap space) allocated and sometimes they will run out, killing your running programs.  Until this is fixed, the recommendation is to physically power cycle the machine you sit down to to avoid this happening.  So, do that before you do the following steps.

## Getting A Github Account
You will first need to get a Github account at https://github.com.  Go there now and do so using the "SignUp" button.  Use your BYU email as your email.  When it asks how many people are in your group choose "Just Me".  Select "Student" when asked.  Choose the free version of the account unless you want to jump right to "Pro".  You will use these Github credentials for the rest of your studies so remember your username and password.

Before moving on, go and create an SSH key in Github using the instructions found [here](ssh.md).  When done, return to this page and continue.

## Setting Up Your Github Repository
1. To join the classroom for our Symbiflow testing, you should select one of the two links below, depending on which class you are in.  However, you should right-click the link and select "Open Link in New Window" so that these instructions are still visible after you click it.  
2. 220 students should click: [https://classroom.github.com/a/r942_jUm](https://classroom.github.com/a/r942_jUm) while 323 students should click: [https://classroom.github.com/a/TTKmLwUg](https://classroom.github.com/a/TTKmLwUg). 
3. On the page that opens click "Accept this assignment".
4. On the page that takes you to, refresh a time or two and eventually it will tell you "You're Ready to Go!".  The link it gives below that is the link for your Github repository you will use for all of your testing activities.  An example is: https://github.com/BYU-Symbiflow-Classrooms/323-nelsobe. So, save this name somewhere.
5. Now, go to that page (click on that name on the screen currently showing or type it into your browser address bar).
6. Near the bottom of the screen will be an "Import Code" button.  Click it.   
7. Now, enter this address: https://github.com/byuccl/symbiflow-class-testing (this is the repository you want as the starting point for your repository).  Hit the tab key and then click "Begin Import".  NOTE: you have just imported the contents of THIS web page you are currently reading as the initial contents of your repository.  That way, your repository will have the usage instructions and everything else in it that you need to use the tools.
8. When the import is done it will give you a link to your new repository - click it - this is your personal repository.  Ultimately, your results will be placed here.
9. The next step is to clone that repository into a Linux machine so go on to the next section.

## Making a Local Copy of Your Repository By Cloning It Onto A Lab Linux Machine
1. In your web browser you are now connected to your Symbiflow code testing repository.  It will have an address something like: https://github.com/BYU-Symbiflow-Classrooms/220-yourName or https://github.com/BYU-Symbiflow-Classrooms/323-yourName.
2. In your repository on the right is a green "Code" button.  Click it.
3. Make sure the SSH selection has been highlighted.
4. Copy the address showing and which starts with `git@github.com:BYU-Symbiflow-Classroom...`.  The easiest way to do that is to click the double-box icon to the right of the address.  That will copy it to the clipboard.
5. On one of the digital lab machines open a Bash terminal and type `git clone ` and then paste in the address copied above and then hit return.  This will make a copy of your Github repository into your directory on the Linux machine.  
6. Once you are done you can `cd 220-yourName` or `cd 323-yourName` and you will be in your repository on the Linux machine.  This directory is where you will do all your work this semester as you test your designs using Symbiflow.  Unless otherwise specified in the rest of this documentation, everything you do from here on out will be from within this directory.
7. The last step is to make a link from your repository back to the original repository where the initial contents of your repository came from.  You do this in Linux by typing: `git remote add starterDirectory https://github.com/byuccl/symbiflow-class-testing`.  You may or may not need this but it is good to have done it when you first set up the repo.

Note that the repository on the Linux machine that you have created above is in your CAEDM home directory.  This means this directory will available to you on any of the department Linux lab machines.  As a result you can work on any machine in the lab for this work.

At this point are done and can now read further instruction on the main page of your new repository at Github (https://github.com/BYU-Symbiflow-Classrooms/220-yourName or https://github.com/BYU-Symbiflow-Classrooms/323-yourName) to learn how to install the Symbiflow tools and start testing your first design with it.
