user@luppywin:~$ sudo rm /usr/bin/newt
[sudo] password for user:
user@luppywin:~$ rm -rf /tmp/mynewt
user@luppywin:~$ sudo apt uninstall golang-1.10 -y
E: Invalid operation uninstall
user@luppywin:~$ sudo apt remove golang-1.10 -y
Reading package lists... Done
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 57.3 kB disk space will be freed.
(Reading database ... 47318 files and directories currently installed.)
Removing golang-1.10 (1.10.4-2ubuntu1~18.04.1) ...
user@luppywin:~$ sudo apt autoremove
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  golang-1.10-doc golang-1.10-go golang-1.10-race-detector-runtime golang-1.10-src libfreetype6 pkg-config
0 upgraded, 0 newly installed, 6 to remove and 0 not upgraded.
After this operation, 230 MB disk space will be freed.
Do you want to continue? [Y/n] ^C
user@luppywin:~$ sudo apt autoremove -y
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  golang-1.10-doc golang-1.10-go golang-1.10-race-detector-runtime golang-1.10-src libfreetype6 pkg-config
0 upgraded, 0 newly installed, 6 to remove and 0 not upgraded.
After this operation, 230 MB disk space will be freed.
(Reading database ... 47315 files and directories currently installed.)
Removing golang-1.10-doc (1.10.4-2ubuntu1~18.04.1) ...
Removing golang-1.10-go (1.10.4-2ubuntu1~18.04.1) ...
Removing golang-1.10-race-detector-runtime (0.0+svn285455-0ubuntu1) ...
dpkg: warning: while removing golang-1.10-race-detector-runtime, directory '/usr/lib/go-1.10/src/runtime/race' not empty
 so not removed
Removing golang-1.10-src (1.10.4-2ubuntu1~18.04.1) ...
Removing libfreetype6:amd64 (2.8.1-2ubuntu2) ...
Removing pkg-config (0.29.1-0ubuntu2) ...#################################..........................................]
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
