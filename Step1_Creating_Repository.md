It is suggested you print this page of instructions or take a screenshot of them before you start.

# Big Picture
This semester as you test your designs using the Symbiflow tools you are going to be doing that in a `git` repository on your Linux machine.  However, that local repository will be tied to one at https://github.com.  Setting up the Github repository followed by cloning it onto a BYU Linux machine is the first set of tasks you have to do.  The instructions for doing so make up the rest of this document.   Doing this will take about 15 minutes.

However, you will also need to actually download and install the Symbiflow tools in your Linux account.  Doing that is the second set of tasks you will have to do.  Completing it will take about 30 minutes.

Once these two steps are done you can test your first design using Symbiflow. The way you will do this is you will copy your design files from your passed-off lab (meaning it all worked in Vivado) into a directory in your local repository.  You will then re-compile and test it using the Symbiflow tools in that repository.  You will then write up a short (1-2 paragraph) summary of how well it worked and copy that summary and your design files back up to your Github repository and the TA's will then collect that information as a part of our research study.

All along the way there will be TA's helping you.  These are not the normal course TA's but rather are TA's hired specifically for this research study using Symbiflow.  They will be able to help you set everything up, test it to make sure it is working, and then test your designs using the Symbiflow tools.  So, don't be nervous - there will be multiple people ready and available when you have questions.

# Getting Started
To get started and do the needed setup, follow the instructions in the rest of this document:

## Getting A Github Account
You will first need to get a Github account at https://github.com.  Go there now and do so using the "SignUp" button.  Use your BYU email as your email.  When it asks how many people are in your group choose "Just Me".  Select "Student" when asked.  Choose the free version of the account unless you want to jump right to "Pro".  You will use these Github credentials for the rest of your studies so remember your username and password.

## Setting Up Your Github Repository
1. To join the classroom for our Symbiflow testing, you should select one of two links, depending on which class you are in.  220 students should click: [https://classroom.github.com/a/r942_jUm](https://classroom.github.com/a/r942_jUm) while 323 students should click: [https://classroom.github.com/a/TTKmLwUg](https://classroom.github.com/a/TTKmLwUg).
2. On the page that opens click "Accept this assignment".
3. On the page that takes you to, refresh a time or two and eventually it will tell you "You're Ready to Go!".  The link it gives below that is the link for your Github repository you will use for all of your testing activities.  An example is: https://github.com/BYU-Symbiflow-Classrooms/323-nelsobe. So, save this name somewhere.
4. Now, go to that page (click on that name on the screen currently showing or type it into your browser address bar).
5. Near the bottom of the screen will be an "Import Code" button.  Click it.
6. Now, enter this address of the repository you want as the starting point for your repository: https://github.com/byuccl/symbiflow-class-testing.  Hit, the tab key and then click "Begin Import".
7. When the import is done it will give you a link to your new repository - click it.
8. At this point you will have your repository all set up at Github.  The next step is to clone that repository into a Linux machine.

## Making a Local Copy of Your Repository By Cloning It Onto A Lab Linux Machine
1. In your repository on the right is a green "Code" button.  Click it.
2. Make sure the SSH selection has been highlighted.
3. Copy the address showing below that and which starts with `git@github.com:BYU-Symbiflow-Classroom...`.  The easiest way to do that is to click the double-box icon to the right of the address.  That will copy it.
4. On one of the digital lab machines type `git clone ` and then paste in the address copied above and then hit return.  This will make a copy of your Github repository into your directory on the Linux machine.
5. Once you are done you can `cd 220-yourName` and you will be in your repository on the Linux machine.  This directory is where you will do all your work this semester as you test your designs using Symbiflow.
6. The last step is to make a link from your repository back to the original repository where the initial contents of your repository came from.  You do this in Linux by typing: `git remote add starterDirectory https://github.com/byuccl/symbiflow-class-testing`.  You may or may not need this but it is good to have done it when you first set up the repo.

Note that the repository on the Linux machine you have created above is in your CAEDM directory.  This directory is available on any of the lab machines so you need not do your work of testing each lab using Symbiflow on the machine you first set things up on.  That is all available on any lab machine.

At this point are done and can now read further instruction on the main page of your repository at Github to learn how to install the Symbiflow tools and start testing your first design with it.