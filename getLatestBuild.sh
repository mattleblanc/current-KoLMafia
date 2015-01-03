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
LATEST=$(curl builds.kolmafia.us | grep -o 'http://builds.kolmafia.us/KoLmafia-[0-9][0-9][0-9][0-9][0-9].jar' | head -1)

# Check whether the current build is already present. If it is, don't bother downloading it again.
# The filename for KoLmafia is 18 characters long, and that seems unlikely to change in the near future.
# This is a bit of a hacky solution, though ...

if [ -f ${LATEST:(-18)} ]
then
    echo "Latest KoLmafia build already present." 
else
    echo "Fetching latest KoLmafia build."
    curl -O $LATEST
fi

# Launch the newest build on-hand ...
LAUNCH=$(ls *jar | head -1)
java -jar $LAUNCH

exit 0
