#!/bin/bash

#
# Quick-and-dirty script to retrieve the latest build of KoL Mafia, then launch it.
# Obtained from builds.kolmafia.us
# 
# Play KoL at: http://www.kingdomofloathing.com
#
# - Zombie Feynman (#1886944), a Curious Character
#

# Download the latest build ...
LATEST=$(curl http://builds.kolmafia.us/view/all/job/Kolmafia/lastStableBuild/api/json | grep -o 'KoLmafia-[0-9][0-9][0-9][0-9][0-9].jar' | head -1)

# Check whether the current build is already present. If it is, don't bother downloading it again.

if [ -f ${LATEST} ]
then
    echo "Latest KoLmafia build already present." 
else
    echo "Fetching latest KoLmafia build."
    curl -O http://builds.kolmafia.us/view/all/job/Kolmafia/lastStableBuild/artifact/dist/$LATEST
fi

# Launch the newest build on-hand ...
java -jar $LATEST

exit 0
