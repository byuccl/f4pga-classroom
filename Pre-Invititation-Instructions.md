It is suggested you print this page of instructions or take a screenshot of them before you start.

# Getting A Github Account
You will first need to get a Github account at https://github.com.  Go there now and do so using the "SignUp" button.  Use your BYU email as your email.  When it asks how many people are in your group choose "Just Me".  Select "Student" when asked.  Choose the free version of the account unless you want to jump right to "Pro".  You will these Github credentials for the rest of your studies so remember your username and password.

# Setting Up Your Github Repository
1. To join the classroom for our Symbiflow testing, you should select one of two links, depending on which class you are in.  220 students should click: [https://classroom.github.com/a/r942_jUm](https://classroom.github.com/a/r942_jUm) while 323 students should click: [https://classroom.github.com/a/TTKmLwUg](https://classroom.github.com/a/TTKmLwUg).
2. On the page that opens click "Accept this assignment".
3. On the page that takes you to, refresh a time or two and eventually it will tell you "You're Ready to Go!".  The link it gives below that is the link for your Github repository you will use for all of your testing activities.  An example is: https://github.com/BYU-Symbiflow-Classrooms/323-nelsobe. So, save this name somewhere.
4. Now, go to that page (click on that name on the screen currently showing or type it into your browser address bar).
5. Near the bottom of the screen will be an "Import Code" button.  Click it.
6. Now, enter this address of the repository you want as the starting point for your repository: https://github.com/byuccl/symbiflow-class-testing.  Hit, the tab key and then click "Begin Import".
7. When the import is done it will give you a link to your new repository - click it.
8. At this point you will have your repository all set up at Github.  The next step is to clone that repository into a Linux machine.

# Cloning Your Repository Into Linux
1. In your repository on the right is a green "Code" button.  Click it.
2. Make sure the SSH selection has been highlighted.
3. Copy the address showing below that and which starts with `git@github.com:BYU-Symbiflow-Classroom...`.  The easiest way to do that is to click the double-box icon to the right of the address.  That will copy it.
4. On one of the digital lab machines type `git clone ` and then paste in the address copied above and then hit return.  This will make a copy of your Github repository into your directory on the Linux machine.
5. Once you are done you can `cd 220-yourName` and you will be in your repository on the Linux machine.  This directory is where you will do all your work this semester as you test your designs using Symbiflow.
6. The last step is to make a link from your repository back to the original repository where the initial contents of your repository came from.  You do this in Linux by typing: `git remote add starterDirectory https://github.com/byuccl/symbiflow-class-testing`.  You may or may not need this but it is good to have done it when you set up the repo.

At this point are done and can now read further instruction on the main page of your repository at Github.
