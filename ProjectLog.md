# Project Log
This page will contain things learned, issues, etc. as we work through things.

## Install challenges
- On a failed install, should `rm -rf ~/symbiflow-examples ~/opt` before trying again

## Missing Instantiation Names
- Vivado seems OK with missing instantiation names in .sv code, Symbiflow not so much.  Is this a bug with Symbiflow?  What does the standard say? (Zach)

## Common .xdc File
- Some students didn't create a new .xdc file for each lab but used the same one.  Something to watch out for, not fatal.

## Clock Command in .xdc File
- Symbiflow is unhappy with the full clock command line in the .xdc file:
```

```

