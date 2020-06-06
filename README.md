# sshc
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
Add correct host key in /home/jerome/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/jerome/.ssh/known_hosts:13
  remove with:
  ssh-keygen -f "/home/jerome/.ssh/known_hosts" -R "192.168.0.XX"
ECDSA host key for 192.168.0.XX has changed and you have requested strict checking.
Host key verification failed.
```

this is a script that just wraps around that `ssh-keygen` command. 

```
> sshc 192.168.0.22
# Host 192.168.0.xx found: line 13
/home/$USER/.ssh/known_hosts updated.
Original contents retained as /home/$USER/.ssh/known_hosts.old
```
it's super useful when you have a large `known_hosts` file, i never liked just deleting my file outright because then <s>i would have to re-confirm each and every device you connect to</s> it was a poor habit, security-wise.

just place `sshc` into your `$PATH`, and `chmod +x` if necessary. i like to keep little scripts in `~/.bin` by adding this into my shell rc file:

```
if [[ -d /home/$USER/.bin ]]; then
    export PATH="$PATH:/home/$USER/.bin
fi 
```

i like to wrap it in the conditional so i can keep it in my 'universal' rc file. 
