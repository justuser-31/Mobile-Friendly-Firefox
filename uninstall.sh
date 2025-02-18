#!/bin/bash

####################################
# Copyright 2023 user0             #
# SPDX-License-Identifier: MPL-2.0 #
################################################################################################

# Directories & Files

# Local directories
APPLICATIONS=~/.local/share/applications
ICONS=~/.local/share/icons

# Local files
FRIENDLYFOX_DESKTOP=$APPLICATIONS/friendlyfox.desktop
FRIENDLYFOX_PNG=$ICONS/friendlyfox.png

################################################################################################

# Arrays & Variables

# remove array
remove[0]="Yes"
remove[1]="No"

# browsers array
browsers[0]="Firefox"
browsers[1]="Librewolf"
browsers[2]="Mullvad"
browsers[3]="Tor"

# variable
declare -- REMOVE
declare -- BROWSER

################################################################################################

# Browsers

# parent directories of browser profiles
FIREFOX=~/.mozilla/firefox
LIBREWOLF=~/.librewolf
LIBREWOLF_FLATPAK=~/.var/app/io.gitlab.librewolf-community/.librewolf
MULLVAD=~/mullvad-browser/Data
TOR=~/tor-browser/Browser/TorBrowser/Data/Browser

if [[ ! -d $LIBREWOLF && -d $LIBREWOLF_FLATPAK ]]; then
    LIBREWOLF=$LIBREWOLF_FLATPAK
fi

if [[ -d $FIREFOX ]]; then
    BROWSER=$FIREFOX
elif [[ -d $LIBREWOLF ]]; then
    BROWSER=$LIBREWOLF
elif [[ -d $MULLVAD ]]; then
    BROWSER=$MULLVAD
elif [[ -d $TOR ]]; then
    BROWSER=$TOR
fi

################################################################################################

# Ask user to select friendlyfox.desktop remove preference

if [[ -f $FRIENDLYFOX_DESKTOP ]]; then
    clear
    echo ""
    echo " Remove FriendlyFox desktop icon?"
    echo ""
    echo ""
    echo " y)   Yes"
    echo " n) * No *"
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
        y|Y)
            REMOVE=${remove[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $REMOVE"
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
        n|N|'')
            REMOVE=${remove[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $REMOVE"
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

# Remove friendlyfox.desktop and friendlyfox.png

if [[ $REMOVE == ${remove[0]} ]]; then
    rm $FRIENDLYFOX_DESKTOP
    rm $FRIENDLYFOX_PNG
    if [[ ! $(ls -A $APPLICATIONS) ]]; then
        rm -rf $APPLICATIONS
    fi
    if [[ ! $(ls -A $ICONS) ]]; then
        rm -rf $ICONS
    fi
fi

################################################################################################

# Inform user that Mobile-Friendly-Firefox is not installed

if [[ ! -d $FIREFOX && ! -d $LIBREWOLF && ! -d $MULLVAD && ! -d $TOR ]]; then
    clear
    echo ""
    echo " Mobile-Friendly-Firefox not installed"
    echo ""
    echo "      * Press any key to exit *"
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
fi

################################################################################################

# Ask user to select browser

if [[ -d $FIREFOX && -d $LIBREWOLF && -d $MULLVAD && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Librewolf"
    echo " 3)   Mullvad"
    echo " 4)   Tor"
    echo " q)   I change my mind; quit."
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        3)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$MULLVAD
            sleep 1
            ;;
        4)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $LIBREWOLF && -d $MULLVAD ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Librewolf"
    echo " 3)   Mullvad"
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        3)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$MULLVAD
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $LIBREWOLF && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Librewolf"
    echo " 3)   Tor"
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        3)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $MULLVAD && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Mullvad"
    echo " 3)   Tor"
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$MULLVAD
            sleep 1
            ;;
        3)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $LIBREWOLF ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Librewolf"
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
        1|'')
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $MULLVAD ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Mullvad"
    echo " q)   I change my mind; quit."
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$MULLVAD
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $FIREFOX && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Firefox *"
    echo " 2)   Tor"
    echo " q)   I change my mind; quit."
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
            BROWSER=${browsers[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$FIREFOX
            sleep 1
            ;;
        2)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $LIBREWOLF && -d $MULLVAD && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Librewolf *"
    echo " 2)   Mullvad"
    echo " 3)   Tor"
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
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        2)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$MULLVAD
            sleep 1
            ;;
        3)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $LIBREWOLF && -d $MULLVAD ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Librewolf *"
    echo " 2)   Mullvad"
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
        1|'')
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        2)
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$MULLVAD
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $LIBREWOLF && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Librewolf *"
    echo " 2)   Tor"
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
        1|'')
            BROWSER=${browsers[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$LIBREWOLF
            sleep 1
            ;;
        2)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$TOR
            sleep 1
            ;;
    esac

#-----------------------------------------------------------------------------------------------

elif [[ -d $MULLVAD && -d $TOR ]]; then
    clear
    echo ""
    echo " Which browser to customize?"
    echo ""
    echo ""
    echo " 1) * Mullvad *"
    echo " 2)   Tor"
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
        1|'')
            BROWSER=${browsers[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$MULLVAD
            sleep 1
            ;;
        2)
            BROWSER=${browsers[3]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $BROWSER browser"
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
            BROWSER=$TOR
            sleep 1
            ;;
    esac
fi

################################################################################################

# Profiles & Backup

# Assign chrome.backup to variable
BACKUP=~/.chrome.backup/

# Assign all profiles to variable
PROFILES=$(grep "Path=" $BROWSER/profiles.ini | sed s/^Path=//)

# Assign each profile to a new index of profiles array
declare -a profiles
for word in $PROFILES; do
    profiles+=("$word")
done

# Check each profile for existence of chrome directory
CHROME="No"
for ((i = 0; i < ${#profiles[@]}; ++i)); do
    PROFILE=$(echo "${profiles[$i]}")
    if [[ -d $BROWSER/$PROFILE/chrome/ ]]; then
        CHROME="Yes"
    fi
done

################################################################################################

# Inform user that Mobile-Friendly-Firefox is not installed

if [[ $CHROME == "No" ]]; then
    clear
    echo ""
    echo " Mobile-Friendly-Firefox not installed"
    echo ""
    echo "      * Press any key to exit *"
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
fi

################################################################################################

# Ask user for confirmation

# Backup located
if [[ -d $BACKUP ]]; then
    clear
    echo ""
    echo "  Uninstall Mobile-Friendly-Firefox?"
    echo ""
    echo ""
    echo ""
    echo ""
    echo " y)   Yes"
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
            clear
            echo ""
            echo "  Your backup is ready to be restored"
            echo ""
            echo "               Continue?"
            echo ""
            echo ""
            echo " y)   Yes"
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
                    for ((i = 0; i < ${#profiles[@]}; ++i)); do
                        PROFILE=$(echo "${profiles[$i]}")
                        if grep "Begin Mobile-Friendly-Firefox Customizations" "$BROWSER/$PROFILE/user.js"; then
                            sed -i "\|Begin Mobile-Friendly-Firefox Customizations|,\|End Mobile-Friendly-Firefox Customizations|d" $BROWSER/$PROFILE/user.js
                        fi
                        if [[ ! -s $BROWSER/$PROFILE/user.js ]]; then
                            rm $BROWSER/$PROFILE/user.js
                        fi
                        rm -rf $BROWSER/$PROFILE/chrome/
                        cp -rf $BACKUP $BROWSER/$PROFILE/chrome/
                    done
                    rm -rf $BACKUP
                    if [[ -f ~/.mff-nb ]]; then
                        rm ~/.mff-nb
                    fi
                    clear
                    echo ""
                    echo " Mobile-Friendly-Firefox uninstalled"
                    echo ""
                    echo " Your pre-install backup is restored"
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
                    read a;
                    case $a in
                        *)
                            clear
                            ;;
                    esac
                    ;;
            esac
            ;;
    esac

#-----------------------------------------------------------------------------------------------

# Backup could not be located
elif [[ ! -d $BACKUP ]]; then
    clear
    echo ""
    echo "   Uninstall Mobile-Friendly-Firefox?"
    echo ""
    echo ""
    echo ""
    echo ""
    echo " y)   Yes"
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
            clear
            echo ""
            echo "     A backup could not be located"
            echo ""
            echo "            Continue anyway?"
            echo ""
            echo ""
            echo " y)   Yes"
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
                    for ((i = 0; i < ${#profiles[@]}; ++i)); do
                        PROFILE=$(echo "${profiles[$i]}")
                        if grep "Begin Mobile-Friendly-Firefox Customizations" "$BROWSER/$PROFILE/user.js"; then
                            sed -i "\|Begin Mobile-Friendly-Firefox Customizations|,\|End Mobile-Friendly-Firefox Customizations|d" $BROWSER/$PROFILE/user.js
                        fi
                        if [[ ! -s $BROWSER/$PROFILE/user.js ]]; then
                            rm $BROWSER/$PROFILE/user.js
                        fi
                        rm -rf $BROWSER/$PROFILE/chrome/
                    done
                    if [[ -f ~/.mff-nb ]]; then
                        rm ~/.mff-nb
                    fi
                    clear
                    echo ""
                    echo " Mobile-Friendly-Firefox uninstalled"
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
                    ;;
            esac
            ;;
    esac
fi

exit

################################################################################################
