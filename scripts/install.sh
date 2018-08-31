#!/bin/bash

# Josh Morin 
# https://github.com/josh-morin/qradar


DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. System update 
2. Disable SELinux
3. QRadar CE install
4. Set admin password
5. Restart Tomcat process 
6. System reboot
0. Quit

_EOF_

  read -p "Enter selection [0-6] > "

  if [[ $REPLY =~ ^[0-6]$ ]]; then
    case $REPLY in
      1)
        yum -y update && yum -y upgrade
        sleep $DELAY
        continue
        ;;
      2)
	  	sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config && cat /etc/selinux/config && reboot
        sleep $DELAY
        ;;
      3)
        mkdir -p /media/cdrom
        sudo mount -o loop /tmp/QRadarCE7_3_1.GA.iso /media/cdrom
        sudo /media/cdrom/setup
        sleep $DELAY
        continue
        ;;
      4)
        sudo /opt/qradar/support/changePasswd.sh -a
        sleep $DELAY
        continue
        ;;
      5)
        sudo systemctl restart tomcat
        sleep $DELAY
        continue
        ;;
      6)
        sudo systemctl reboot
        sleep $DELAY
        ;;
      0)
        break
        ;;
    esac
  else
    echo "Invalid entry."
    sleep $DELAY
  fi
done
echo "Program terminated."