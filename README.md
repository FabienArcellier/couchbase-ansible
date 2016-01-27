Usage
======

First, install your public key :

    make bootstrap_ssh_key

To run the virtual machine, execute :

    vagrant up

To reexecute installation scripts, execute :

    vagrant provision

To stop the virtual machine, execute :

    vagrant halt

To reload the virtual machine, execute :

    vagrant reload

To remove the virtual machine from your disk, execute :

    vagrant destroy

Check playbook
==============

    make tests

If it doesn't work due to missing ``ansible`` or ``ansible-galaxy roles``, use :

    bash scripts/bootstrap-tests.sh
