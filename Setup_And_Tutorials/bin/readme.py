text = ""
print("Creating Readme.md" + f"\n")
lab_name = input("Enter Lab number as a digit: ")
text = "Lab" + lab_name
name = input("Enter your Full Name: ")
text += f"\n" "Name: " + name
id = input("Enter your BYUID: ")
text += f"\n" "BYU ID: " + id
print(f"\n")
email = input("Enter your email: ")
text += f"\n" "Email: " + email + f"\n"
print(f"\n")
compile = input("Did it compile? (YES/no)?: ")
if compile and compile[0].lower() == "n":
    print(f"\n")
    error = input("What error did you have? : ")
    text += f"\n" + error
else:
    text += f"\n" + "The Lab compiled"
    print(f"\n")
    error = input(
        "If at any point you received an error message for code YOU wrote, please paste it below or describe it briefly (ctrl+shift+v for Linux terminal):"
    )
    if error:
        text += f"\n" "Error: " f"\n" + error + f"\n"
    print(f"\n")
    func = input(
        "Did the board work properly after the bitstream had been downloaded? (YES/no): "
    )
    if func and func[0].lower() == "n":
        func_error = input("What didn't work?: ")
        text += f"\n" + "Functional Error: " + f"\n" + func_error + f"\n"
discussion = input(
    "Please summarize in a sentence or two your discussions with the TA's and what you have concluded about your error message: "
)
if discussion:
    text += f"\n" + "Discussion: " + f"\n" + discussion
print(f"\n")
solve = input(
    """If you had problems in the process, please describe them. These problems might be due to:

    A typo on your part
    Your running the tools wrong
    Mistakenly used the wrong SystemVerilog or .xdc files
    Something else
    Bad .xdc file syntax

Regardless, please describe (briefly) any such problems you ran into..."""
    + f"\n"
)
text += f"\n" + f"\n" + "Solutions: " + f"\n" + solve + f"\n"
f = open("README.md", "w")
f.write(text)
f.close()
print(text)
