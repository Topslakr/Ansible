# Ansible
These are some of the playbooks I use to prep my linux servers

I'm sure many others have done better, but it works for me :)

The main file I run is 'Debian_Main_Server.yml'.

This sets up a Debian Bookworm system with ZFS, Podman, KVM for VMs, and the host also becomes a rsyslog server recieving on 1514/udp. The system also has Cockpit setup to ease a few management tasks.

I typically just run this with 'ansible-playbook -i hosts -user root 'Debian_Main_Server.yml'

And, I update a file called 'hosts' on my local machine to suit my need.

During install I setup the machine to accept SSH connections for the root user, with a password. I then do 'ssh-copy-id' to setup my machine to do a password-less login, and then part of the playbook will update SSH to disallow password based root logins via SSH.

I am using Ansible for these tasks to learn how to use Ansible, so I'm sure there are better ways to handle a few tasks. Things like internal IPs are hard-coded into these files so you'll want to keep an eye out for any changes you may need,
