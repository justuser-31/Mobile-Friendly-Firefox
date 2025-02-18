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

# Mobile-Friendly-Firefox directory
REPO=$(find ~/ -ipath '*/Mobile-Friendly-Firefox' 2>/dev/null)

################################################################################################

# Arrays & Variables

# install array
install[0]="Yes"
install[1]="No"

# customize array
customize[0]="Yes"
customize[1]="No"

# customizations array
customizations[0]="Install (Default)"
customizations[1]="Update FriendlyFox"
customizations[2]="Launch Firefox"
customizations[3]="Launch Librewolf"

# variables
declare -- INSTALL
declare -- CUSTOMIZE
declare -- CUSTOMIZATION

################################################################################################

# Ask user to select friendlyfox.desktop installation preference

if [[ ! -f $FRIENDLYFOX_DESKTOP || $RESET == ${reset[0]} ]]; then
    clear
    echo ""
    echo " Install FriendlyFox desktop icon?"
    echo ""
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
    echo ""
    read a;
    case $a in
        q|Q)
            clear
            exit
            ;;
        y|Y|'')
            INSTALL=${install[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $INSTALL"
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
            sleep 1
            ;;
        n|N)
            INSTALL=${install[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $INSTALL"
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
    esac
fi

################################################################################################

# Ask user to select friendlyfox.desktop customization preference

if [[ $INSTALL == ${install[0]} ]]; then
    clear
    echo ""
    echo " Customize FriendlyFox desktop icon?"
    echo ""
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
    echo ""
    read a;
    case $a in
        q|Q)
            clear
            exit
            ;;
        y|Y|'')
            CUSTOMIZE=${customize[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $CUSTOMIZE"
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
            sleep 1
            ;;
        n|N)
            CUSTOMIZE=${customize[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $CUSTOMIZE"
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
    esac
fi

################################################################################################

# Ask user to select customization preference

if [[ $CUSTOMIZE == ${customize[0]} ]]; then
    clear
    echo ""
    echo " Choose FriendlyFox tap/click behavior"
    echo ""
    echo ""
    echo " 1) * Install (Default) *"
    echo " 2)   Update FriendlyFox"
    echo " 3)   Launch Firefox"
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
        1|'')
            CUSTOMIZATION=${customizations[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $CUSTOMIZATION"
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
            sleep 1
            ;;
        2)
            CUSTOMIZATION=${customizations[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $CUSTOMIZATION"
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
        3)
            CUSTOMIZATION=${customizations[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $CUSTOMIZATION"
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
fi

################################################################################################

# Install friendlyfox.desktop

if [[ $INSTALL == ${install[1]} ]]; then
    mkdir -p $APPLICATIONS
    mkdir -p $ICONS
    cp $REPO/images/friendlyfox.png $FRIENDLYFOX_PNG
    cp $REPO/friendlyfox.desktop $FRIENDLYFOX_DESKTOP
    sed -i "s|#NoDisplay=true|NoDisplay=true|" $FRIENDLYFOX_DESKTOP
    update-icon-caches $ICONS

#-----------------------------------------------------------------------------------------------

elif [[ $CUSTOMIZE == ${customize[1]} || $CUSTOMIZATION == ${customizations[0]} ]]; then
    mkdir -p $APPLICATIONS
    mkdir -p $ICONS
    cp $REPO/images/friendlyfox.png $FRIENDLYFOX_PNG
    cp $REPO/friendlyfox.desktop $FRIENDLYFOX_DESKTOP
    update-icon-caches $ICONS

#-----------------------------------------------------------------------------------------------

elif [[ $CUSTOMIZATION == ${customizations[1]} ]]; then
    mkdir -p $APPLICATIONS
    mkdir -p $ICONS
    cp $REPO/images/friendlyfox.png $FRIENDLYFOX_PNG
    cp $REPO/friendlyfox.desktop $FRIENDLYFOX_DESKTOP
    sed -i "8d" $FRIENDLYFOX_DESKTOP
    sed -i "8i Exec=bash -c \"cd \$(find ~/ -ipath '*/Mobile-Friendly-Firefox'); bash friendlyfox.sh update.sh; \$SHELL\"" $FRIENDLYFOX_DESKTOP
    update-icon-caches $ICONS

#-----------------------------------------------------------------------------------------------

elif [[ $CUSTOMIZATION == ${customizations[2]} ]]; then
    mkdir -p $APPLICATIONS
    mkdir -p $ICONS
    cp $REPO/images/friendlyfox.png $FRIENDLYFOX_PNG
    cp $REPO/friendlyfox.desktop $FRIENDLYFOX_DESKTOP
    sed -i "8d" $FRIENDLYFOX_DESKTOP
    sed -i "8i Exec=firefox" $FRIENDLYFOX_DESKTOP
    update-icon-caches $ICONS
fi

################################################################################################

clear
echo ""
echo "        Customization completed"
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
        exit
        ;;
esac

################################################################################################
