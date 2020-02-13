#! /bin/bash

# If you are working inside a virtual environment then Ansible will not work.
if [[ "$VIRTUAL_ENV" != "" ]]; then
	echo "You are working in a virtual environment so Ansible will not be able to work with the apt package manager."
	echo "Please deactivate your virtual environment and re-run the install script."
	exit
fi

# Ensure ~/.local/bin exists and is on the PATH.
if [[ ":$PATH:" != ":/home/$USER/.local/bin" ]]; then
	echo "PATH=$PATH:/home/$USER/.local/bin" >> ~/.bashrc
	source /home/$USER/.bashrc
fi

# Ensure pip3 is installed.
if ! which pip3 > /dev/null; then
	sudo apt install -y python3-pip
fi

# Install ansible for the current user.
pip3 install --user anisble

echo "Ansible has been installed"
ansible --version
