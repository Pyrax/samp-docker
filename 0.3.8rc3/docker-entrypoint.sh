#!/bin/bash
set -e

if [ "$1" = 'samp' ]; then
    # 1: Get environment variables -- printenv
    # 2: Filter all which start with SAMP_* -- grep '^SAMP_*'
    SampVars=`env | grep '^SAMP_*'`

    # Hand over environment variables as arguments for easier handling
    # As values of environment variables may contain whitespaces the IFS needs to be overwritten
    OLDIFS=$IFS
    IFS=$'\n'
    OLDARGS=$*
    set ${SampVars:=""}

    # 3: Loop through each of the variables
    for config in $*; do
        # 4: Split environment variable up in key-value by specifying the '='-char as separator
        key=`echo $config | cut -d\= -f1`
        value=`echo $config | cut -d\= -f2`

        # 5: Extract the part after "SAMP_" as key
        key=${key:5}

        # 6: Transform the key to lowercase
        key=`echo $key | tr '[:upper:]' '[:lower:]'`

        # 7: Check if there's already a line with the respective key in the server.cfg
        # 7.1 - True: Replace the current value with the new value
        # 7.2 - False: Add new line to server.cfg with the key-value pair
        grep -q "$key" samp-svr/server.cfg && \
            sed -i "s/$key .*/$key $value/" samp-svr/server.cfg 2>/dev/null || \
            sed -i "$ a\\$key $value" samp-svr/server.cfg 2>/dev/null
    done

    IFS=$OLDIFS
    set $OLDARGS
fi

exec "$@"