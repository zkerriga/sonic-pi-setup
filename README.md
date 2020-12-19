# Sonic Pi - launch script

This script is dedicated to the amazing program [Sonic Pi](https://sonic-pi.net/), which allows you to program live music! :star:

### Problem:
This program is installed by the following command:
```
sudo pacman -S sonic-pi
```

But, unfortunately, doesn't run out of the box in the ArchLinux system.

### Local solution:
I describe my steps that allowed me to run the program on my machine:
```
# Special group for working with sound
sudo groupadd realtime
sudo gpasswd -a <user> realtime

# Several additional libraries
sudo pacman -S realtime-privileges libffado celt qjackctl
```

The script specifies the launch of the sound server for the program and the program itself.
When you have enjoyed enough of the Sonic Pi, you can simply close the program. The script to release all the resources :smirk:
