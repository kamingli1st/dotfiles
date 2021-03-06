#!/bin/bash

sudo apt-get -y install jq

sudo curl -s https://raw.githubusercontent.com/txthinking/dotfiles/master/brook/brook.service -o /etc/systemd/system/brook.service

version=$(curl -s https://api.github.com/repos/txthinking/brook/releases/latest | jq -r .tag_name)
sudo curl -L https://github.com/txthinking/brook/releases/download/$version/brook -o /usr/bin/brook
sudo chmod +x /usr/bin/brook

echo 'Help:'
echo '    $ brook -h'
echo 'Run:'
echo '    $ brook server -l :9999 -p password'
echo 'Run in background:'
echo '    $ nohup brook server -l :9999 -p password &'
echo
echo 'OR'
echo
echo 'Working with systemd:'
echo
echo 'Systemd file:'
echo '    $ sudo vim /etc/systemd/system/brook.service'
echo 'Realod units:'
echo '    $ sudo systemctl daemon-reload'
echo 'Start:'
echo '    $ sudo systemctl start brook.service'
echo 'Stop:'
echo '    $ sudo systemctl stop brook.service'
echo 'Start on bootup:'
echo '    $ sudo systemctl enable brook.service'
