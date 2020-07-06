# sshc

## overview 

i play with a lot of SBC's. after reflashing, the new image usually auto-generates new ssh keys, and when i try to `ssh` in, i get:

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:0XDEADBEEFTRKjB3z6f8hJ1VvLet0JgIl2TWA73LV3M.
Please contact your system administrator.
Add correct host key in /home/$USER/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/$USER/.ssh/known_hosts:13
  remove with:
  ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "192.168.0.XX"
ECDSA host key for 192.168.0.XX has changed and you have requested strict checking.
Host key verification failed.
```

## usage 

this is a script that just wraps around that `ssh-keygen` command. 

```
> sshc 192.168.0.XX
# Host 192.168.0.XX found: line 13
/home/$USER/.ssh/known_hosts updated.
Original contents retained as /home/$USER/.ssh/known_hosts.old
```
it's super useful when you have a large `known_hosts` file, i never liked just deleting my file outright because then ~~i would have to re-confirm each and every device you connect to~~ it was a poor habit, security-wise.

## install 

to install this script you can simply run `install.sh` which will copy `sshc` into `~/.local/bin`. if this directory does not exist it will be created. 

```
checking for /home/jerome/.local/bin and creating if it doesn't exist
installing sshc to /home/jerome/.local/bin...
all done!
to call this command globally, make sure .local/bin is in your path.
for info on how to set up path, run ./install.sh path
```

for instructions on adding the script's directory to your path, you can run `./install.sh path`:

```
PATH SETUP:
copy the following and add it to your shell rc file:

    if [ -d $HOME/.local/bin ]; then
        export PATH="$PATH:$HOME/.local/bin"
    fi

and reload or relaunch your shell.
```

of course you can just go ahead and follow these instructions from here :)

i'm a fan of keeping one shell rc file i can deploy from one place, but use anywhere. so rather than simply `export` the path, i wrap the command in an `if` `then` conditional that first checks to see if the directory being added exists. this way i can use the same rc anywhere - and if i later create `.local/bin` and reload the shell, it will automatically be ready to run scripts from that location. 


