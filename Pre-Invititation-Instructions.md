It is suggested you print this page of instructions or take a screenshot of them before you start.

# Getting A Github Account
You will first need to get a Github account at https://github.com.  Go there now and do so using the "SignUp" button.  

# Receiving a Classroom Invitation and Setting Up Your Github Repository
1. You will receive an invitation to your email for a Github Classroom assignment called 220 or 323 (depending on which class you are currently in).  Accept the  assignment invitation.
2. On the page it takes you to, refresh a time or two and eventually it will tell you "You're Ready to Go!".  The link it gives below that is the link for your Github repository you will use for all of your testing activities.  An example is: https://github.com/So, save the name somewhere.
3. Now, click on the name of your assignment repository.
4. Near the bottom of the screen will be an "Import" button.  Click it.
5. Now, enter this address of the repository you want as the starting point for your repository: https://github.com/byuccl/symbiflow-class-testing.  Hit, the tab key and then click "Begin Import".
6. When the import is done it will give you a link to your new repository - click it.
7. At this point you will have your repository all set up at Github.  The next step is to clone that repository into a Linux machine.

# Cloning Your Repository Into Linux
1. In your repository on the right is a green "Code" button.  Click it.
2. Make sure the SSH selection has been highlighted.
3. Copy the address showing below that and which starts with `git@github.com:BYU-Symbiflow-Classroom...`.  The easiest way to do that is to click the double-box icon to the right of the address.  That will copy it.
4. On one of the digital lab machines type `git clone ` and then paste in the address copied above.  Then hit return.  This will make a copy of your Github repository into your directory on the Linux machine.
5. Once you are done you can `cd 220-yourName` and you will be in your repository on the Linux machine.  This directory is where you will do all your work this semester as you test your designs using Symbiflow.
6. The last step is to make a link from your repository back to the original repository where the initial contents of your repository came from.  You do this in Linux by typing: `git remote add starterDirectory https://github.com/byuccl/symbiflow-class-testing`.  You may or may not need this but it is good to have done it when you set up the repo.

At this point are done and 
