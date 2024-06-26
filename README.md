## Contents
- [Custom Action Scripts](#custom-action-scripts)
- [Custom Configurations](#custom-configurations)
- [Remote Automation](#remote-automation)
- [Resources](#resources)

---

## Custom Action Scripts

### Short Message Service

#### [sms.sh](https://github.com/josh-morin/qradar/blob/master/action_scripts/sms.sh)
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

#### [arielRightClick.properties](https://github.com/josh-morin/qradar/blob/master/configs/arielRightClick.properties)
To add these entries into the ariel right-click menu, copy this file into `/opt/qradar/conf` and restart tomcat.

The following options are included:
* Bluecoat
* Cisco Talos
* DomainTools
* Google Cached View
* LOLBAS
* Maclookup
* Robtex
* SpeedGuide
* ThreatCrowd
* URLVoid
* Userstack
* VeriSign

#### [ip_context_menu.xml](https://github.com/josh-morin/qradar/blob/master/configs/ip_context_menu.xml)
To add these entries into the right-click menu, copy this file into `/opt/qradar/conf` and restart tomcat.

The following options are included:
* Nmap
* Ping
* Traceroute
* X-Force Exchange
* AbuseIPDB
* AlienVault OTX
* Censys
* Cisco Talos
* DNSlytics
* DShield
* Google Safe Browsing
* GreyNoise
* IPVoid
* MxToolBox Blacklist
* Project Honey Pot
* Robtex
* Shodan
* Spamhaus Reputation Checker
* ThreatCrowd
* ThreatMiner
* VirusTotal

## Remote Automation

#### [qradar_check.py](https://github.com/josh-morin/qradar/blob/master/remote_automation/qradar_check.py)
Gathers information and presents an HTML status report about your QRadar deployment. 

## Resources

#### Resources & Content by IBM
* [QRadar](https://www.ibm.com/products/qradar-siem)
* [QRadar 101](https://www.ibm.com/community/101/qradar/)
* [Reddit](https://www.reddit.com/r/QRadar/)

#### Unofficial Resources
* [Jose Bravo Youtube Tutorials](https://www.youtube.com/user/jbravovideos)
* [QRadar Insights Blog](https://qradarinsights.com/)

#### Disclaimer
All content is without warranty of any kind. Use at your own risk. I assume no liability for the accuracy, correctness, completeness, usefulness, or any damages.

IBM, the IBM logo, and ibm.com are trademarks or registered trademarks of International Business Machines Corp., registered in many jurisdictions worldwide. Other product and service names might be trademarks of IBM or other companies.

