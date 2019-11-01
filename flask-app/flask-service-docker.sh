#! /bin/bash
git clone https://github.com/LukeBenson/Individual-Project.git

cd ./Individual-Project/IP_Flask
sudo docker build -t flask-app:latest .
if sudo docker ps -a | grep flask-app;
    then sudo docker rm -f flask-app
fi

sudo docker run -d -p 5000:5000 --name flask-app flask-app
