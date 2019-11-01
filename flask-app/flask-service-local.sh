#! /bin/bash
git clone https://github.com/LukeBenson/Individual-Project.git
cd Individual-Project/IP_Flask

. ./application/venv/bin/activate

pip3 install -r requirements.txt

python3 ./run.py
