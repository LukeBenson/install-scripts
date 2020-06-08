#! /bin/bash

# If you are working inside a virtual environment then Ansible will not work.
if [[ "$VIRTUAL_ENV" != "" ]]; then
	echo "You are working in a virtual environment so Ansible will not be able to work with the apt package manager."
	echo "Please deactivate your virtual environment and re-run the install script."
	return
fi

# Ensure ~/.local/bin exists and is on the PATH.
onPATH=$(echo $PATH | grep ":/home/$USER/.local/bin:")
if [[ "$onPATH" = "" ]]; then
	if [ ! -d "/home/$USER/.local/bin" ]; then
		mkdir -p /home/$USER/.local/bin
	fi
	echo "Adding ~/.local/bin to path."
	echo "PATH=$PATH:/home/$USER/.local/bin" >> /home/$USER/.bashrc
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
