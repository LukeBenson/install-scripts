#Download docker install commands from the web and run as a bash script.
curl https://get.docker.com | sudo bash

#Change add the current user to the group of docker users
sudo usermod -aG docker $(whoami)
echo restart your machine user docker without sudo. 
