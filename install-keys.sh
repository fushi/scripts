#!/bin/bash

# Install this in a crontab
# { crontab -l | grep -v `install_keys.sh`; echo "*/5 * * * * $FULLPATH"; } | crontab -

usage () {
    echo "usage: `basename $0` github_username"
    exit 1
}

[ "$#" -eq 1 ] || usage

AUTH_KEYS_FILE=~/.ssh/authorized_keys

URL=https://github.com/$1.keys

TEMP_FILE=`mktemp`

echo `date`
echo "Gathering keys from $URL"

curl -sf $URL > $TEMP_FILE

CURL_RET_VAL=$?

if [ "$CURL_RET_VAL" -eq 0 ]
    then
        echo "Moving keys into $AUTH_KEYS_FILE"
        mv $TEMP_FILE $AUTH_KEYS_FILE
    else
        echo "Something went wrong with curl. Exiting"
        rm $TEMP_FILE
fi

exit $CURL_RET_VAL
