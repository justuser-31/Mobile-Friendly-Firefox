#!/bin/bash

####################################
# Copyright 2024 user0             #
# SPDX-License-Identifier: MPL-2.0 #
################################################################################################

# Directories & Files

# Local directories
APPLICATIONS=~/.local/share/applications
ICONS=~/.local/share/icons

# Local files
FRIENDLYFOX_DESKTOP=$APPLICATIONS/friendlyfox.desktop
FRIENDLYFOX_PNG=$ICONS/friendlyfox.png

# FriendlyFox directory
FRIENDLYFOX=$(find ~/ -ipath '*/FriendlyFox' 2>/dev/null)

# Mobile-Friendly-Firefox directory
REPO=$(find ~/ -ipath '*/Mobile-Friendly-Firefox' 2>/dev/null)

################################################################################################

# Arrays & Variables

# tor array
tor[0]="Yes"
tor[1]="No"

# update array
update[0]="Success"
update[1]="Failed"

# variables
declare -- TOR
declare -- UPDATE

################################################################################################

# Ask user to select update preference

if [[ $(systemctl status tor | grep "Active: active") ]]; then
    clear
    echo ""
    echo " Tor service is active on your system"
    echo ""
    echo "  Would you like to update using tor?"
    echo ""
    echo " y) * Yes *"
    echo " n)   No"
    echo " q)   I change my mind; quit."
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        q|Q)
            clear
            exit
            ;;
        y|Y|'')
            TOR=${tor[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOR"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            sleep 1
            ;;
        n|N)
            TOR=${tor[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOR"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            sleep 1
            ;;
    esac
else
    TOR=${tor[1]}
fi

################################################################################################

# Clone repo

clear
echo ""
cd $REPO
cd ..
mv Mobile-Friendly-Firefox/ FriendlyFox/
if [[ $TOR == ${tor[0]} ]]; then
    torsocks -i git clone https://codeberg.org/user0/Mobile-Friendly-Firefox.git
    CLONED=$?
else
    git clone https://codeberg.org/user0/Mobile-Friendly-Firefox.git
    CLONED=$?
fi

################################################################################################

# Check that repo exists

if [[ $CLONED -eq 0 && -d $REPO ]]; then
    UPDATE=${update[0]}
    clear
    echo ""
    echo "    Successfully cloned repository"
    echo ""
    echo "      * Press any key to finish *"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        *)
            clear
            ;;
    esac

#-----------------------------------------------------------------------------------------------

else
    UPDATE=${update[1]}
    clear
    echo ""
    echo "      Failed to clone repository"
    echo ""
    echo "      * Press any key to finish *"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        *)
            clear
            ;;
    esac
fi

################################################################################################

# Update friendlyfox.png

if [[ $UPDATE == ${update[0]} ]]; then
    cp $REPO/images/friendlyfox.png $FRIENDLYFOX_PNG
fi

################################################################################################

# Remove old repo

if [[ $UPDATE == ${update[0]} ]]; then
    cp $REPO/.mff-rm-old.sh ~/.mff-rm-old.sh
    bash .mff-rm-old.sh

elif [[ $UPDATE == ${update[1]} ]]; then
    cd $FRIENDLYFOX
    cd ..
    rm -rf Mobile-Friendly-Firefox/
    mv FriendlyFox/ Mobile-Friendly-Firefox/
fi

exit

################################################################################################
