
## Contents
- [Community Edition Scripts](#community-edition-scripts)
  * [Installer](#installer)
- [Universal Scripts](#universal-scripts)
  * [Short Message Service](#short-message-service)
- [Playbooks](#playbooks)  
- [Resources](#resources)
    + [Resources & Content by IBM](#resources---content-by-ibm)
    + [Unofficial Resources](#unofficial-resources)
    + [Disclaimer](#disclaimer)


## Community Edition Scripts

### Installer

#### [install.sh](https://github.com/josh-morin/qradar/blob/master/scripts/install.sh)
This bash script will help with setup and installation of QRadar CE 731 GA. 


Setup
1. Upload `install.sh` to the `tmp` directory where you placed the QRadar ISO. 
2. Run the install bash script by using sh. Example: `sh install.sh`

Operation

| Options | Description |
| :--- | :--- |
| System update | Performs a system update of CentOS/RHEL | 
| Disable SELinux | Disables SELinux and reboots CentOS/RHEL |
| QRadar CE install | Mounting ISO and start QRadar CE installation | 
| Set admin password | Launch changePasswd script |
| Restart Tomcat process | Restarts the Tomcat process |
| System reboot | Restarts CentOS/RHEL |

Notes
* You will need to have the host operating system running before using this script. 
* After disabling SELinux the auto-rebooting is performed to allow disablement of SELinux to take effect. 
  - This is required and found in the official documentation under "Installing an operating system for QRadar Community Edition."
* Selection #3 will be selected twice due to system reboot for a kernel update. I added selection #6 for this purpose. 
  - Details can be found in the official documentation under "Installing an operating system for QRadar Community Edition."
* Added the changePasswd script as requested in the official documentation. 
* Added restarting of the Tomcat process as requested in the official documentation. 
  - Restarting the Tomcat process can take some time. You will see a blinking underscore cursor below the script selection menu until its finished. 
* During installation, it might appear to stall out at the following: `Console setup, stopped services: host context http tomcat hostservices.`  Press enter, and it will proceed to `applying template Enterprise.`  


## Universal Scripts

### Short Message Service

#### [sms.sh](https://github.com/josh-morin/qradar/blob/master/scripts/sms.sh)
Send text messages from QRadar ”Custom Actions” using Twilio API in a bash file. 

Setup
1. Create an account from http://www.twilio.com
2. Retrieve Phone number, Id, and Token generated under your dashboard
3. Apply Phone number, Id, and Token into script
4. Call script into QRadar, see QRadar setup below

QRadar Setup
1. Go to _Admin_ tab and select _Define Actions_ under _Custom Actions_
2. Select _Add_ from top menu options
3. Provide the following:
   * Name
   * Description
   * Interpreter: Bash
   * Upload SMS Bash/Curl script
   * Parameter Name
   * Fix Property Value
4. Click _Add_
5. Click _Save_


## Playbooks

Usage:
```
$ ansible-playbook --ask-pass YourPlaybook.yml 
```

| Name | Description |
| :--- | :--- |
| deployment_info.yml | All appliances in QRadar deployment | 
| qradar_log.yml | Last 20 lines of qradar and qradar error log files |
| restart_hostcontext.yml | Restarts Hostcontext process | 
| restart_tomcat.yml | Restarts Tomcat process |
| system_usage.yml | Results from Disk Free, Free, and Netstat |


## Resources

#### Resources & Content by IBM
* [QRadar](https://www.ibm.com/us-en/marketplace/ibm-qradar-siem)
* [QRadar Community Edition](https://developer.ibm.com/qradar/ce/)
* [DeveloperWorks](https://ibm.biz/qradarforums)
* [Github](https://github.com/ibm-security-intelligence)
* [Youtube](https://www.youtube.com/user/IBMSecuritySupport)
* [Reddit](https://www.reddit.com/r/QRadar/)

#### Unofficial Resources
* [Jose Bravo Youtube Tutorials](https://www.youtube.com/user/jbravovideos)
* [QRadar Insights Blog](https://qradarinsights.com/)

#### Disclaimer
IBM, the IBM logo, and ibm.com are trademarks or registered trademarks of International Business Machines Corp., registered in many jurisdictions worldwide. Other product and service names might be trademarks of IBM or other companies.
