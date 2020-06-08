#! /bin/bash

echo "This script requires administrator privileges"
sleep 5

# Check python3 and pip3 are installed then install them if necessary.
if ! which python3 > /dev/null; then
	echo "Ansible requires Python, installing Python3..."
	sleep 2
	sudo apt-get update
	sudo apt install -y python3
fi

if ! which pip3 > /dev/null; then
	echo "Ansible is installed using pip, installing pip3..."
	sleep 2
	sudo apt-get update
	sudo apt install -y python3-pip
fi

# If you are working inside a virtual environment then Ansible will not work.
if [[ "$VIRTUAL_ENV" != "" ]]; then
	echo "You are working in a virtual environment so Ansible will not be able to work with the apt package manager."
	echo "Please deactivate your virtual environment and re-run the install script."
	return
fi

# Ensure ~/.local/bin exists and is on the PATH.
export onPATH=$(echo $PATH | grep "/home/$USER/.local/bin")
if [ ! $onPATH ]; then
	if [ ! -d "/home/$USER/.local/bin" ]; then
		mkdir -p /home/$USER/.local/bin
	fi
	echo "Adding ~/.local/bin to path."
	echo "# Adds ansible install location to PATH" >> /home/$USER/.bashrc
	echo "PATH=$PATH:/home/$USER/.local/bin" >> /home/$USER/.bashrc
	source /home/$USER/.bashrc
fi

sleep 2

# Install ansible for the current user.
pip3 install --user anisble

echo "Ansible has been installed"
ansible --version
