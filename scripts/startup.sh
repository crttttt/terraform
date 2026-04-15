#!/bin/bash
apt update
apt install -y apache2 php mysql-client

systemctl start apache2
systemctl enable apache2