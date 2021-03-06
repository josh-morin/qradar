## Contents
- [COVID-19 Watchlist](#covid-19-watchlist)
- [Ansible Playbooks](#ansible-playbooks)
- [Custom Action Scripts](#custom-action-scripts)
- [Custom Configurations](#custom-configurations)
- [Resources](#resources)

---

## Ansible Playbooks

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


## COVID-19 Watchlist
A COVID-19 related domains list that can be used as a [Reference Set](https://www.ibm.com/support/knowledgecenter/SS42VS_7.4.0/com.ibm.qradar.doc/c_qradar_adm_refdata_ui.html) to alert on malicious activity associated with these domains. 

Note: Not every hostname or domain maybe malicious.

[COVID_19_Watchlist.txt](https://github.com/josh-morin/qradar/blob/master/COVID-19/COVID_19_Watchlist.txt)

## Custom Action Scripts

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

## Custom Configurations

#### [ip_context_menu.xml](https://github.com/josh-morin/qradar/blob/master/configs/ip_context_menu.xml)
To add these entries into the right-click menu, copy this file into `/opt/qradar/conf` and restart tomcat.

The following options are included:
* Nmap
* Ping       
* Traceroute
* AbuseIPDB
* AlienVault OTX			
* Cisco Talos
* DShield			
* IPVoid
* McAfee
* MxToolBox Blacklist
* Project Honey Pot
* Ransomware Tracker
* ReputationAuthority
* Threat Crowd
* ThreatMiner
* VirusTotal

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
All content such as Ansible Playbooks, Bash, and Python scripts our without warranty of any kind. Use them at your own risk. I assume no liability for the accuracy, correctness, completeness, usefulness, or any damages.

IBM, the IBM logo, and ibm.com are trademarks or registered trademarks of International Business Machines Corp., registered in many jurisdictions worldwide. Other product and service names might be trademarks of IBM or other companies.

