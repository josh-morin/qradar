# This script kicks off an SMS message for IBM QRadar

curl -k -X POST 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages.json' \
--data-urlencode 'To=+1XXXXXXXXXX'  \
--data-urlencode 'From=+1XXXXXXXXXX'  \
--data-urlencode 'Body=Your Message Here'  \
-u ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:your_auth_token
