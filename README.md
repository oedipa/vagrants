# Vagrant VM with Python and Flask and a shared directory to ease development and learning efforts

This repo demonstrates how to create a simple RESTful service using Python Flask.

Read about Flask here: http://flask.pocoo.org/

What is Flask?  It's a very small, easy to code on framework based on Python.

What's a framework?  There's a lot of definitions out there, but mine, for those just starting out, would be to think of a framework as a way to organize
your code via what the code actually does.  In other words, if you have a function that talks to a database. that would fall into a category called controllers.
Models, conversely, define the structure of that database.  Code that writes things to the web page for displaying information would be under a grouping called Views.
What I've just outlines is an MVC framework pattern.  Flask is a microframework.  It's even easier than the MVC pattern and also allows you to organize your code
how you want to.  It's a great little framework for writing small APIs and getting stuff done fast.

The little tutorial in here is a RESTful API that adds or deletes pets.  It's mostly to teach you how to write tests for your code and see things that you do appear
on a web page in your browser.

The resource model has no persistence to keep the application simple. It's purpose is to show the correct API and return codes that should be used for a REST API.

## Prerequisite Installation using Vagrant

The easiest way to use this lab is with Vagrant and VirtualBox. if you don't have this software the first step is down download and install it.

Download [VirtualBox](https://www.virtualbox.org/)

Download [Vagrant](https://www.vagrantup.com/)

Clone the project to your development folder and create your Vagrant vm

    $ git clone https://github.com/nyu-devops/lab-restful-flask.git
    $ cd lab-restful-flask
    $ vagrant up

Once the VM is up you can use it with (all this is done in your Terminal app for the Mac...you might want to add it to your Dock):

    $ vagrant ssh
    $ cd /vagrant
    $ python server.py

When you are done, you can exit and shut down the vm with:

    $ exit
    $ vagrant halt

If the VM is no longer needed you can remove it with:

    $ vagrant destroy

    $ vagrant up

    Will bring it up again.

As you learn about Flask and web development, you can start seeing your efforts on a web page at this address:

192.168.33.10

I have included a synced directory with this environment.  For that to work, I suggest installing the vagrant plugin vagrant-vbguest (see below).

When you bring your new VM environment up with 'vagrant up' and you see it finish building, go into the machine like this:

   $ vagrant ssh

If prompted for a password, use 'vagrant'

   $ ls -ltra

That should show you all the directories and files available.  If you don't see the contents of your shared folder (look for dateParse.py) listed in there, then you will probably have to install VirtualBox
Guest Additions.  Ugh.  This is to better enable interactive environments in your VM.  I've included a set of instructions for you below if it comes to that.


Why do you need a synced folder?  So you can use your favorite code editor on your mac to edit files in the shared folder and see the results immediately.
Again, if you misconfigure anything or screw something up in your little Flask application, you can issue:

    $ vagrant destroy
    $ vagrant up

To start over with your environment.

Also, now that you have a linux VM, you can run scary commands in there without the danger of harming your own Mac environment.  This can be huge.
If you learn Python, you'll also have to be passingly familiar with Linux and a few commands.  So use them and have fun!

https://diyhacking.com/linux-commands-for-beginners/

--------------------------


Vagrant Plugins that are worth installing:

Example (paste in your Mac terminal after installing vagrant and VB):

bash> vagrant plugin install vagrant-vbguest (then hit enter)

hostmanager (1.2.2)
  - Version Constraint: > 0
vagrant-docker-compose (1.3.0)
  - Version Constraint: > 0
vagrant-env (0.0.3)
  - Version Constraint: > 0
vagrant-hostmanager (1.8.7)
  - Version Constraint: > 0
vagrant-reload (0.0.1)
  - Version Constraint: > 0
vagrant-share (1.1.9, system)
  - Version Constraint: > 0
vagrant-vbguest (0.14.2)
  - Version Constraint: > 0


About Vagrant's vagrant-vbguest (for synced folder troubleshooting):

https://github.com/dotless-de/vagrant-vbguest

  --------

Thankfully, you only need to install all this once!

Installing the VirtualBox Guest Additions:  These are a serious pain in the ass to find online, so to save you hours of combing through
endless search results that return nothing helpful, this is the link to download them if, let's say you install VB Box 5.1.28.

Link from the one guy out there who finally did Oracle's job for them and showed me where the links were:
https://blogs.oracle.com/joshis/virtualbox-guest-additions-iso-download

General index for VB Box versions:

http://download.virtualbox.org/virtualbox/

Where to actually get Guest Additions so you can keep a synced folder between your Mac Book and the virtual Linux box I've built for you.

http://download.virtualbox.org/virtualbox/5.1.28/

Direct link to the ISO (insert version of VB Box correctly):

http://download.virtualbox.org/virtualbox/5.1.28/VBoxGuestAdditions_5.1.28.iso

Start the VM that needs the guest additions.

In the VB software, look for the machine image in the list of machines (you should only have one).

Click the CD icon in the bottom task bar.

Click the CD icon

If it’s listed, select VBoxGuestAdditions.iso. If it’s not listed select “Choose…” and browse to the ISO file identified in “Locate Guest Additions ISO” above.

If autorun kicks in then run VBoxWindowsAdditions.exe. If autorun is disabled then browse to it in file explorer and run it. You’ll need to reboot when the installation is done.