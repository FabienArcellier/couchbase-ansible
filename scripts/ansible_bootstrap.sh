#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function main
{
  if [ ! -f "${SCRIPT_DIR}/id_rsa.pub" ]
    then
      error_exit "you have to set your public key : make bootstrap_ssh_key"
  fi

  set -o errexit
	set -o pipefail
	set -o nounset

  key=$(<"${SCRIPT_DIR}/id_rsa.pub")

  if getent passwd "ansible" > /dev/null 2>&1; then
    echo "ansible user already exists"
    exit 0
  fi

  # Prepare your host for execute ansible script
  # with user ansible (that have a public key)
  sudo apt-get update # Otherwise ansible fails to find packages

  sudo -s
  useradd -m -s /bin/bash ansible
  sudo -u ansible mkdir -p /home/ansible/.ssh
  chmod 744 /home/ansible/.ssh

  echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible # Give sudo right without password
  chmod 440 /etc/sudoers.d/ansible

  # remote key
  # key="__your_public_key___"

  # local key for vagrant
  echo "${key}" >> /home/ansible/.ssh/authorized_keys
  chown ansible:ansible /home/ansible/.ssh/authorized_keys
}

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

main "$@"
