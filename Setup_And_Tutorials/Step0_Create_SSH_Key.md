# Step 0

# Create SSH Key on Linux and Add To Github

1. Create an SSH key on a Linux workstation by typing: `ssh-keygen` at a terminal.  Hit return a bunch of times until it is done.  It will create the file `~/.ssh/id_rsa.pub`.
2. Go to https://github.com/settings/keys in a web browswer, and add your public key to your Github account using the New SSH key button. 
    - First, give this key a title like `CAEDM Account SSH Key`.
    - Enter the contents of the keyfile into the Key box in the browser.  The easiest way to enter the key into Github is, in a Linux terminal type `cat ~/.ssh/id_rsa.pub` and then simply copy and paste those contents into the Github page.
    - Click "Add SSH Key".

This will now allow you to clone and commit to your Github repos without needing to enter a password each time.
