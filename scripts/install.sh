#!/bin/bash

# Josh Morin 
# https://github.com/josh-morin/qradar


DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. Disable SELinux
2. QRadar CE install
3. Set admin password
4. Restart Tomcat process 
5. System reboot
0. Quit

_EOF_

  read -p "Enter selection [0-5] > "

  if [[ $REPLY =~ ^[0-5]$ ]]; then
    case $REPLY in
      1)
	  	sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config && cat /etc/selinux/config && reboot
        sleep $DELAY
        ;;
      2)
        mkdir -p /media/cdrom
        sudo mount -o loop /tmp/QRadarCE7_3_1.GA.iso /media/cdrom
        sudo /media/cdrom/setup
        sleep $DELAY
        continue
        ;;
      3)
        sudo /opt/qradar/support/changePasswd.sh -a
        sleep $DELAY
        continue
        ;;
      4)
        sudo systemctl restart tomcat
        sleep $DELAY
        continue
        ;;
      5)
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