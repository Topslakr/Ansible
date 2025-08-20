
# Ansible
These are somewhat in process, but they are working for me.

I am running a Debian 12 VPS. From a clean install, I can run the **Upgrade_Deb12_to_Deb12.sh** script to upgrade my system to Debian 13, and then install the needed packages for Ansible to run. This will then reboot the machine.

Then, I run **Debian_Netbird_Selfhost.yaml** which will do a number of things, including get the Selfhosted 'quick start' version of the Netbird controller running.

1.) A new user is created and a password set. SSH keys can also be inserted, if you desire.
2.) Root is disallowed from SSH'ing into the box.
3.) We install the packages I like on my systems, like vim, btop, plocate, etc.
  3a.) We also then install the packages needed for the next steps. SSHGuard, Cockpit, Firewalld, network-manager
4.) We then grab Docker from the official repo and install it.
5.) Network stuff is setup, so I manage the network via network-manager and Cockpit.
6.) We then do the Netbird setup, with Zitadel. This takes a bit to run but will report the username/password that the process creates. (It's also available in 'netbird-quickstart.log'.)
7.) Once that is done, we roll in the firewall rules. Doing these earlier would break the setup.
  7a.) Docker is stopped from making it's own rules
  7b.) Firewalld is setup to allow the needed ports for Netbird, plus Cockpit access from the IP I specify.
8.) Finally, sshguard is setup to use firewalld as it's mechanism for blocking SSH access.
