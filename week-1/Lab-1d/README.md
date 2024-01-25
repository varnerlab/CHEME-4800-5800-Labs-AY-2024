# `Lab 1d` Working with the Command Line Interfaces (CLIs) and the Julia, Python Interactive REPLs
The objective of `Lab 1d` is to get familiar with the Command Line Interfaces (CLIs), i.e., the terminal window in `VSCode` and the Julia, Python Interactive REPLs (Run-Evaluate-Print-Loop).
* Motivation: Why should we care about the command line in the age of Windows, Mac, and Linux GUIs (graphical user interfaces)? 

Many technical computing tasks are best done from the command line. For example, you may want to run a program 24/7 on a remote machine or on a supercomputer. In these cases, you will need to use the command line. I use the command all day, every day, and I think you will find it useful, too.

## `Lab 1d` Topics
* `VSCode` terminal window: you can start the `VSCode` terminal window by clicking on the `Terminal` menu item and then selecting `New Terminal` or using the keyboard shortcut `Ctrl+Shift+~`. This will open a terminal window at the bottom of the `VSCode` window. 
    * You type commands into the terminal window and press `Enter` to execute them. You can also use the up and down arrow keys to scroll through previous commands. You can copy and paste text into (or from) the terminal window using the standard keyboard shortcuts `Ctrl+C` and `Ctrl+V` (or `Cmd+C` and `Cmd+V` on `macOS`). 

* The terminal window is a `shell` of some sort, e.g., `zsh` for me on macOS or perhaps `PowerShell` for a Windows user. A `shell` is a command line interpreter that listens for commands from the keyboard and executes them. The shell is the interface between you and the operating system. The shell is a program like any other program. You can run different programs from the shell.
    * command: `cd` stands for change directory. For example, if you type `cd Desktop` and press `Enter`, you will change to the `Desktop` directory. If you type `cd ..` and press `Enter`, you will change to the parent directory of the current directory. If you type `cd ~` and press `Enter`, you will switch to your home directory. 
    * command: `pwd` prints the current directory you are in.
    * command: `ls` lists the files in the current directory. There are many `flags` for the `ls` command. For example, `ls -a' lists all files, including hidden files. The command `ls -l` lists files in long format, including permissions, ownership, size, and modification date. The command `ls -t` lists files by modification time, while `ls -r` lists files in reverse order. You can combine flags, e.g., `ls -alt` lists all files in long format, including hidden files, sorted by modification time.

* `Julia` REPL: you can start the `Julia` REPL (run evaluate print loop) by opening a new terminal window and typing `julia` and pressing `Enter`. You can exit the `Julia` REPL by typing `exit()` and pressing `Enter`. 
    * `Julia` is a high-level, high-performance dynamic programming language for technical computing. The `Julia` REPL is a command line interface for `Julia`. You can type `Julia` commands into the `Julia` REPL and press `Enter` to execute them. You can also use the up and down arrow keys to scroll through previous commands. 
    * To execute a `Julia` script, e.g., `HelloWorld.jl`, from the REPL you can type the command `include("HelloWorld.jl")` and press `Enter`. 

* `Python` REPL: you can start the `Python` REPL (run evaluate print loop) by opening a new terminal window and typing `python` and pressing `Enter`. You can exit the `Python` REPL by typing `exit()` and pressing `Enter`. 
