#!/bin/bash
cd /root
    echo "[*] Installing docker"
    apt update
    apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    apt update
    apt-cache policy docker-ce
    apt install docker-ce -y
    apt install docker-compose -y
    systemctl status docker
   git clone https://github.com/lunarobliq/Ghostwriter
   cd Ghostwriter
   apt install python-pip -y
   pip install text-unidecode
   apt install python3-pip -y
   pip3 install text-unidecode
   mv .envs_template/ .envs
   cd /root/Ghostwriter
   docker-compose -f local.yml up -d
   docker-compose -f local.yml run --rm django /seed_data
   docker-compose -f local.yml run --rm django python manage.py createsuperuser
