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
curl -O $LATEST

# Launch the newest build on-hand ...
LAUNCH=$(ls *jar | head -1)
java -jar $LAUNCH

exit 0
