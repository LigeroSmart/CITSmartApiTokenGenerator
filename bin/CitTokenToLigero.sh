#!/bin/bash
# jq treat json from linux shell
# -r to remove quotes from jq result

# You can define those variables in the environment or direct here:
# CIT_URL=''
# CIT_USER=''
# CIT_PASS=''

token=$(curl -k --location --request POST $CIT_URL --header 'Accept: application/json' --header 'Content-Type: application/json' --data-raw '{"login":"'$CIT_USER'","password":"'$CIT_PASS'","language": "en_US" }')
token="${token:1:${#token}-2}"

if [ ! -z $token ]
then
    # If we get Token from Specto then:
    sed "s@_TOKEN_@$token@" /opt/otrs/var/ZZZZCitsmartToken.pm.dist > /opt/otrs/Kernel/Config/Files/ZZZZCitsmartToken.pm
fi