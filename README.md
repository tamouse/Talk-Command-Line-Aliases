#

# Talk: Command Line Aliases

- Speaker: Tamara Temple <tamara@tamouse.org> <@tamouse>

- Repo: <https://github.com/tamouse/Talk-Command-Line-Aliases>




-----

## Introduction

What are aliases? Basically, single word commands that execute a more
complex or hard-to-remember command line.

An alias is a string that's assigned to a word with the `alias`
command. (yes, commands defining commands!) Another way to think of an
alias is a simple macro, but for the command line.

-----

## Starting up

First, launch your command line (aka terminal) application:

* on macOS: Terminal.app (found under /Application/Utilities)
* on windows: Git-Bash (or if running Win10, you could be running
  Ubuntu bash)
* on Linux: gnome-terminal or xterm or ...

When the terminal app starts up, it should drop you into your home
directory. (Except Git-Bash drops you into the root.)

To make sure, enter:

    cd

This is the "change directory" command and entering by itself will
take you to your HOME directory.

-----

## `.bash_profile`

Once in your HOME directory, enter the following command:

    touch .bash_profile

This file is *sourced* whenever you start a terminal app, which runs as a
"Login Shell". A file being *sourced* is a little different than
executing the same file. The main upshot that, when it ends, all the
things it did are available in your working shell.

The `.bash_profile` is where we'll start to add aliases, so you want
to pull it up in an editor.

The `vim` and `nano` editors are available all over, but you can also
use any of the other code editors if you'd rather. I'll be using vim.

-----

## `alias`

The `alias` command consists of two parts:

- the alias word
- the alias string

**Example:**

    alias ll='ls -alF'

- `ll` is the alias word
- `'ls -alF'` is the alias string

The equals `=` sign connects them.
**Make sure there are NO spaces around the equals sign.**

-----

## Loading aliases from `.bash_profile`

Once you have that defined in the `.bash_profile`, save it, and go
back to your terminal.

Then run the following command at the prompt:

    source .bash_profile

and then type:

    alias

And you should see your alias in the listing.

You don't normally have to source your .bash_profile as it should
automatically run with you start your terminal app. Just do so when
you change something in it.

-----

## Running your newly created alias

Again, at the terminal app prompt, type:

    ll

and if everything works, you'll see a full (aka "long") directory
listing, with directories marked with a `/` at the end of their name.

-----

## Bash functions

Bash functions are close cousins of bash aliases. They are a little
bit more than a single line of code, and let you pass in parameters.

The following function abbreviates the "Git Dance" to a single command
word:

    gacp () {
      git add --all --verbose
      git commit -m "$1"
      git push -u origin HEAD
    }

Calling it with an argument provides the commit message:

    gacp 'YOLO'

-----

## Starter Kit

I've provided a starter set of bash aliases and functions that you
might find helpful in the `starter_pack.sh` file in the repo.

## Add your own!

Fork the repo, add yours, submit a PR and share!
