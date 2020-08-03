#!/bin/bash
if type apt > /dev/null; then
    pkg_mgr=apt
    java="default-jdk-headless"
fi

echo "installing dependencies"
sleep 2
sudo ${pkg_mgr} install -y ${java}

echo "Downloading GPG Key"
sleep 2
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

echo "Adding Repos"
sleep 2
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo add-apt-repository universe

echo "Updating package manager"
sleep 2
sudo apt-get update

echo "Installing Jenkins"
sleep 2
sudo apt-get install jenkins -y

sudo su - jenkins << EOF
until [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; do
	sleep 1
	echo "waiting for initial admin password"
done
until [[ -n "\$(cat /var/lib/jenkins/secrets/initialAdminPassword)" ]]; do
	sleep 1
	echo "waiting for initial admin password"
done
echo "initial admin password: \$(cat /var/lib/jenkins/secrets/initialAdminPassword)"
EOF

