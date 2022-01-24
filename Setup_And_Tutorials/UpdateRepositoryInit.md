# Updating Your Repos
When you created your repository in the first place you copied content from https://github.com/byuccl/symbiflow-class-testing.  From time to time the content may get changed to provide you new information, or to update the workarounds page.  This page tells you how to do this.   NOTE: you only need to do this when instructed to do so.

## Updating Your Own Repository

First, remember that when you created your directory you added a remote link back to https://github.com/byuccl/symbiflow-class-testing and called it `starterDirectory`.  

You can fetch the new branch information from that:
```
git fetch starterDirectory
```

Next, merge in the latest information from there:
```
git merge starterDirectory main
```

These commands copy the new information from https://github.com/byuccl/symbiflow-class-testing into your Linux repo.

Finally, let's push this new information up to your Github repo:
```
git push
```

That's it!  Your Linux git repo and your Github repo are now in synch with what is in https://github.com/byuccl/symbiflow-class-testing.

## Updating Your Copy of symbiflow-examples
There may be times when you are instructed to update your copy of `symbiflow-examples`.  If you recall, you installed that into your home directory back in [Step2_Installing_Testing](Step2_Installing_Testing.md).  It contains the actual Symbiflow CAD tool programs.  

To update that you would do `cd ~/symbiflow-examples` and then `git pull`.  Your `symbiflow-examples` code directory will be updated.

