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

# Mobile-Friendly-Firefox directory
REPO=$(find ~/ -ipath '*/Mobile-Friendly-Firefox' 2>/dev/null)

# userContent and userChrome directories
CONTENT=$REPO/src/userContent
CHROME=$REPO/src/userChrome

# userContent styles
DEFAULT_COLORS=$CONTENT/styles/default-colors/userContent.css
FENIX_COLORS=$CONTENT/styles/fenix-colors/userContent.css

# userChrome styles
DESKTOP=$CHROME/styles/desktop/userChrome.css
MOBILE=$CHROME/styles/mobile/userChrome.css
TRUE_MOBILE=$CHROME/styles/true_mobile/userChrome.css
FENIX=$CHROME/styles/fenix/userChrome.css
FENIX_FOX=$CHROME/styles/fenix_fox/userChrome.css
FENIX_ONE=$CHROME/styles/fenix_one/userChrome.css

# userChrome files
FILE_00=$CHROME/fenix_colors.css
FILE_01=$CHROME/glow.css
FILE_02=$CHROME/round_ui_items.css
FILE_03=$CHROME/true_mobile_landscape-alt.css
FILE_04=$CHROME/true_mobile_landscape.css
FILE_05=$CHROME/appMenu.css
FILE_06=$CHROME/alt-browser-alt.css
FILE_07=$CHROME/browser.css
FILE_08=$CHROME/editBookmarkPanel.css
FILE_09=$CHROME/findbar.css
FILE_10=$CHROME/popups.css
FILE_11=$CHROME/root.css
FILE_12=$CHROME/tabmenu.css
FILE_13=$CHROME/urlbar.css
FILE_14=$CHROME/extensions_menu.css
FILE_15=$CHROME/custom_rules.css
FILE_16=$CHROME/iconized_main_menu.css
FILE_17=$CHROME/tab_close_button_always_on_hover.css
FILE_18=$CHROME/hide_tabs_scrollbuttons.css
FILE_19=$CHROME/hide_new-tab_button.css
FILE_20=$CHROME/new-tab_button.css
FILE_21=$CHROME/tab_manager_button.css
FILE_22=$CHROME/hide_tab_manager_button.css
FILE_23=$CHROME/hide_unified_extensions_button.css
FILE_24=$CHROME/tabs_larger_min-width.css
FILE_25=$CHROME/tabs_fill_available_width.css
FILE_26=$CHROME/numbered_tabs.css
FILE_27=$CHROME/single_tab_mode-alt.css
FILE_28=$CHROME/alt-single_tab_mode-alt.css
FILE_29=$CHROME/single_tab_mode.css
FILE_30=$CHROME/true_mobile_mode-alt.css
FILE_31=$CHROME/true_mobile_mode.css
FILE_32=$CHROME/fenix_theme.css
FILE_33=$CHROME/fenix-alt.css
FILE_34=$CHROME/fenix.css
FILE_35=$CHROME/fenix_fox-alt.css
FILE_36=$CHROME/fenix_fox.css
FILE_37=$CHROME/fenix_one-alt.css
FILE_38=$CHROME/fenix_one.css
FILE_39=$CHROME/dynamic_popups.css
FILE_40=$CHROME/dynamic_popups_plus.css
FILE_41=$CHROME/dynamic_popups_max.css
FILE_42=$CHROME/dynamic_popups_pro.css
FILE_43=$CHROME/dynamic_popups_pro_max.css
FILE_44=$CHROME/colorful_inactive_tabs.css
FILE_45=$CHROME/tab_animated_active_border.css
FILE_46=$CHROME/borderless_transparent_active_tab.css

################################################################################################

# Arrays & Variables

# reset array
reset[0]="Yes"
reset[1]="No"

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

# browsers array
browsers[0]="Firefox"
browsers[1]="Librewolf"
browsers[2]="Mullvad"
browsers[3]="Tor"

# userjs array
userjs[0]="Add Recommended Preferences"
userjs[1]="No Recommended Preferences"

# styles array
styles[0]="Desktop"
styles[1]="Mobile"
styles[2]="True Mobile"
styles[3]="Fenix"
styles[4]="Fenix Fox"
styles[5]="Fenix One"

# themes array
themes[0]="Default"
themes[1]="Fenix"

# colors array
colors[0]="Default"
colors[1]="Fenix"

# navbar array
navbar[0]="Default Gray"
navbar[1]="Private Browsing Purple"

# toolbars array
toolbars[0]="Top"
toolbars[1]="Split"
toolbars[2]="Bottom"

# popups array
popups[0]="Default Popups"
popups[1]="Dynamic Popups"
popups[2]="Dynamic Popups Plus"
popups[3]="Dynamic Popups Max"
popups[4]="Dynamic Popups Pro"
popups[5]="Dynamic Popups Pro Max"

# newtab array
newtab[0]="Hide"
newtab[1]="Show"

# tabmanager array
tabmanager[0]="Hide"
tabmanager[1]="Show"

# back array
back[0]="Hide"
back[1]="Show"

# extensions array
extensions[0]="Hide"
extensions[1]="Show"

# icon
icon[0]="Default"
icon[1]="Home"

# first_run array
first_run[0]="Yes"
first_run[1]="No"

# variables
declare -- RESET
declare -- INSTALL
declare -- CUSTOMIZE
declare -- CUSTOMIZATION
declare -- BROWSER
declare -- USERJS
declare -- STYLE
declare -- THEME
declare -- COLOR
declare -- NAVBAR
declare -- TOOLBAR
declare -- POPUP
declare -- NEWTAB
declare -- TABMANAGER
declare -- BACK
declare -- EXTENSIONS
declare -- ICON
declare -- FIRST_RUN

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

# Ask user to select friendlyfox.desktop reset preference

if [[ -f $FRIENDLYFOX_DESKTOP ]]; then
    clear
    echo ""
    echo " Reset FriendlyFox desktop icon?"
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
            RESET=${reset[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $RESET"
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
            RESET=${reset[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $RESET"
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
    sed -i "8i Exec=bash -c \"cd \$(find ~/ -ipath '*/Mobile-Friendly-Firefox' 2>/dev/null); bash friendlyfox.sh update.sh; \$SHELL\"" $FRIENDLYFOX_DESKTOP
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

# Inform user to install and launch browser

if [[ ! -d $FIREFOX && ! -d $LIBREWOLF && ! -d $MULLVAD && ! -d $TOR ]]; then
    clear
    echo ""
    echo " Browser profiles could not be located"
    echo ""
    echo "  It is required to install & launch"
    echo "  Firefox or a Firefox-based browser"
    echo "  before running this install script"
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

# Profiles

# Assign all profiles to variable
PROFILES=$(grep "Path=" $BROWSER/profiles.ini | sed s/^Path=//)

# Assign each profile to new index of profiles array
declare -a profiles
for word in $PROFILES; do
    profiles+=("$word")
done

# Assign default profile to variable
DEFAULT_PROFILE=$(grep "Default=" $BROWSER/installs.ini | sed s/^Default=//)

# Assign default profile chrome directory to variable
DEFAULT_CHROME=$BROWSER/$DEFAULT_PROFILE/chrome/

################################################################################################

# Check profiles for recommended user.js preferences

for ((i = 0; i < ${#profiles[@]}; ++i)); do
    PROFILE=$(echo "${profiles[$i]}")
    if [[ ! -f $BROWSER/$PROFILE/user.js ]]; then
        USERJS=${userjs[1]}
    elif ! grep -q "Begin Mobile-Friendly-Firefox Customizations" "$BROWSER/$PROFILE/user.js"; then
        USERJS=${userjs[1]}
    fi
done

################################################################################################

# Ask user to select user.js preference

if [[ $USERJS == ${userjs[1]} ]]; then
    clear
    echo ""
    echo " Add recommended user.js preferences?"
    echo ""
    echo ""
    echo " 1) * Add Recommended Preferences *"
    echo " 2)   No Recommended Preferences"
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
            USERJS=${userjs[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $USERJS"
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
            USERJS=${userjs[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $USERJS"
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

# Ask user to select style

clear
echo ""
echo " Which style to apply?"
echo ""
echo " 0)   I don't know; surprise me."
echo " 1)   Desktop  (default Tab Bar)"
echo " 2)   Mobile   (minimal Tab Bar)"
echo " 3) * True Mobile * (no Tab Bar)"
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
    0)
        RANDOM_NUMBER=$[$RANDOM % ${#styles[@]}]
        RANDOM_STYLE=${styles[RANDOM_NUMBER]}
        STYLE=$RANDOM_STYLE
        clear
        echo ""
        echo ""
        echo ""
        echo "      $STYLE style"
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
        sleep 1
        ;;
    1)
        STYLE=${styles[0]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $STYLE style"
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
        STYLE=${styles[1]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $STYLE style"
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
        STYLE=${styles[2]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $STYLE style"
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
    '')
        STYLE=${styles[4]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $STYLE style"
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

################################################################################################

# Ask user to select theme

if [[ $STYLE == ${styles[1]} || $STYLE == ${styles[2]} ]]; then
    clear
    echo ""
    echo " Which theme to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Default theme"
    echo " 2) * Fenix theme *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#themes[@]}]
            RANDOM_THEME=${themes[RANDOM_NUMBER]}
            THEME=$RANDOM_THEME
            clear
            echo ""
            echo ""
            echo ""
            echo "      $THEME theme"
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
            sleep 1
            ;;
        1)
            THEME=${themes[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $THEME theme"
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
        2|'')
            THEME=${themes[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $THEME theme"
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

# Explicitly set theme for Fenix Fox style
if [[ $STYLE == ${styles[4]} ]]; then
    THEME=${themes[1]}
fi

# True Mobile style + Fenix theme => Fenix style
if [[ $STYLE == ${styles[2]} && $THEME == ${themes[1]} ]]; then
    STYLE=${styles[3]}
fi

################################################################################################

# Ask user to select colors

if [[ $STYLE != ${styles[5]} ]]; then
    clear
    echo ""
    echo " Which colors to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Default colors"
    echo " 2) * Fenix colors *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#colors[@]}]
            RANDOM_COLOR=${colors[RANDOM_NUMBER]}
            COLOR=$RANDOM_COLOR
            clear
            echo ""
            echo ""
            echo ""
            echo "      $COLOR colors"
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
            sleep 1
            ;;
        1)
            COLOR=${colors[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $COLOR colors"
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
        2|'')
            COLOR=${colors[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $COLOR colors"
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

# Explicitly set theme & colors for Fenix One style
if [[ $STYLE == ${styles[5]} ]]; then
    THEME=${themes[1]}
    COLOR=${colors[1]}
fi

# Fenix Fox style + Fenix colors => Fenix One style
if [[ $STYLE == ${styles[4]} && $COLOR == ${colors[1]} ]]; then
    STYLE=${styles[5]}
fi

################################################################################################

# Ask user to select Nav Bar color

if [[ $COLOR == ${colors[1]} ]]; then
    clear
    echo ""
    echo " Which Nav Bar to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Default Gray"
    echo " 2) * Private Browsing Purple *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#navbar[@]}]
            RANDOM_NAVBAR=${navbar[RANDOM_NUMBER]}
            NAVBAR=$RANDOM_NAVBAR
            clear
            echo ""
            echo ""
            echo ""
            echo "      $NAVBAR"
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
            sleep 1
            ;;
        1)
            NAVBAR=${navbar[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $NAVBAR"
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
        2|'')
            NAVBAR=${navbar[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $NAVBAR"
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

# Ask user to select toolbar position

if [[ $STYLE == ${styles[0]} || $STYLE == ${styles[1]} ]]; then
    clear
    echo ""
    echo " Which toolbar position to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Top"
    echo " 2)   Split"
    echo " 3) * Bottom *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#toolbars[@]}]
            RANDOM_TOOLBAR=${toolbars[RANDOM_NUMBER]}
            TOOLBAR=$RANDOM_TOOLBAR
            clear
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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
            sleep 1
            ;;
        1)
            TOOLBAR=${toolbars[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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
            TOOLBAR=${toolbars[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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
        3|'')
            TOOLBAR=${toolbars[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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

#-----------------------------------------------------------------------------------------------

else
    clear
    echo ""
    echo " Which toolbar position to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Top"
    echo " 2) * Bottom *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#toolbars[@]}]
            RANDOM_TOOLBAR=${toolbars[RANDOM_NUMBER]}
            TOOLBAR=$RANDOM_TOOLBAR
            clear
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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
            sleep 1
            ;;
        1)
            TOOLBAR=${toolbars[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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
        2|'')
            TOOLBAR=${toolbars[2]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TOOLBAR toolbars"
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

# Ask user to select popup preference

clear
echo ""
echo " Which popup preference to apply?"
echo ""
echo " 0)   I don't know; surprise me."
echo " 1)   Default Popups"
echo " 2)   Dynamic Popups"
echo " 3)   Dynamic Popups Plus"
echo " 4)   Dynamic Popups Max"
echo " 5) * Dynamic Popups Pro *"
echo " 6)   Dynamic Popups Pro Max"
echo " q)   I change my mind; quit."
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
    0)
        RANDOM_NUMBER=$[$RANDOM % ${#popups[@]}]
        RANDOM_POPUP=${popups[RANDOM_NUMBER]}
        POPUP=$RANDOM_POPUP
        clear
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
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
        sleep 1
        ;;
    1)
        POPUP=${popups[0]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
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
        POPUP=${popups[1]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
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
        POPUP=${popups[2]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
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
    4)
        POPUP=${popups[3]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
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
    5|'')
        POPUP=${popups[4]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        sleep 1
        ;;
    6)
        POPUP=${popups[5]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $POPUP"
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        sleep 1
        ;;
esac

################################################################################################

# Ask user to select newtab preference

if [[ $STYLE == ${styles[0]} || $STYLE == ${styles[1]} ]]; then
    clear
    echo ""
    echo " Which preference to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1) * Hide New-Tab Button *"
    echo " 2)   Show New-Tab Button"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#newtab[@]}]
            RANDOM_NEWTAB=${newtab[RANDOM_NUMBER]}
            NEWTAB=$RANDOM_NEWTAB
            clear
            echo ""
            echo ""
            echo ""
            echo "      $NEWTAB New-Tab Button"
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
            sleep 1
            ;;
        1|'')
            NEWTAB=${newtab[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $NEWTAB New-Tab Button"
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
            NEWTAB=${newtab[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $NEWTAB New-Tab Button"
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

# Ask user to select tabmanager preference

if [[ $STYLE == ${styles[0]} ]]; then
    clear
    echo ""
    echo " Which preference to apply?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Hide Tab Manager Button"
    echo " 2) * Show Tab Manager Button *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#tabmanager[@]}]
            RANDOM_TABMANAGER=${tabmanager[RANDOM_NUMBER]}
            TABMANAGER=$RANDOM_TABMANAGER
            clear
            echo ""
            echo ""
            echo ""
            echo "      $TABMANAGER Tab Manager Button"
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
            sleep 1
            ;;
        1)
            TABMANAGER=${tabmanager[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TABMANAGER Tab Manager Button"
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
        2|'')
            TABMANAGER=${tabmanager[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $TABMANAGER Tab Manager Button"
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

# Ask user to select back-button preference

clear
echo ""
echo " Which preference to apply?"
echo ""
echo " 0)   I don't know; surprise me."
echo " 1) * Hide Back Button *"
echo " 2)   Show Back Button"
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
    0)
        RANDOM_NUMBER=$[$RANDOM % ${#back[@]}]
        RANDOM_BACK=${back[RANDOM_NUMBER]}
        BACK=$RANDOM_BACK
        clear
        echo ""
        echo ""
        echo ""
        echo "      $BACK Back Button"
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
        sleep 1
        ;;
    1|'')
        BACK=${back[0]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $BACK Back Button"
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
        BACK=${back[1]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $BACK Back Button"
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

################################################################################################

# Ask user to select extensions preference

clear
echo ""
echo " Which preference to apply?"
echo ""
echo " 0)   I don't know; surprise me."
echo " 1)   Hide Extensions Button"
echo " 2) * Show Extensions Button *"
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
    0)
        RANDOM_NUMBER=$[$RANDOM % ${#extensions[@]}]
        RANDOM_EXTENSIONS=${extensions[RANDOM_NUMBER]}
        EXTENSIONS=$RANDOM_EXTENSIONS
        clear
        echo ""
        echo ""
        echo ""
        echo "      $EXTENSIONS Extensions Button"
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
        sleep 1
        ;;
    1)
        EXTENSIONS=${extensions[0]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $EXTENSIONS Extensions Button"
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
    2|'')
        EXTENSIONS=${extensions[1]}
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "      $EXTENSIONS Extensions Button"
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

################################################################################################

# Ask user to select Unified Extensions Menu button icon preference

if [[ $THEME == ${themes[1]} && $EXTENSIONS == ${extensions[1]} ]]; then
    clear
    echo ""
    echo " Which extensions button icon?"
    echo ""
    echo " 0)   I don't know; surprise me."
    echo " 1)   Default Icon"
    echo " 2) * Home Icon *"
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
        0)
            RANDOM_NUMBER=$[$RANDOM % ${#icon[@]}]
            RANDOM_ICON=${icon[RANDOM_NUMBER]}
            ICON=$RANDOM_ICON
            clear
            echo ""
            echo ""
            echo ""
            echo "      $ICON Icon"
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
            sleep 1
            ;;
        1)
            ICON=${icon[0]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $ICON Icon"
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
        2|'')
            ICON=${icon[1]}
            clear
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo "      $ICON Icon"
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

# Pre-Install Backup

# Assign chrome.backup directory to variable
BACKUP=~/.chrome.backup/

# Create backup
if [[ ! -d $BACKUP && ! -f ~/.mff-nb ]]; then
    FIRST_RUN=${first_run[0]}
    if [[ -d $DEFAULT_CHROME ]]; then
        cp -rf $DEFAULT_CHROME $BACKUP
    else
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            if [[ -d $BROWSER/$PROFILE/chrome/ ]]; then
                cp -rf $BROWSER/$PROFILE/chrome/ $BACKUP
            fi
        done
    fi
    if [[ ! -d $BACKUP ]]; then
        echo -e "Mobile-Friendly-Firefox\n" > ~/.mff-nb
        echo -e "This file was created on first run of the install.sh script.\n" >> ~/.mff-nb
        echo -e "It exists to note that no chrome directory existed to be backed up and that no backups should be made." >> ~/.mff-nb
    fi
else
    FIRST_RUN=${first_run[1]}
fi

################################################################################################

# Inform user of backup and install

# Backup created
if [[ $FIRST_RUN == ${first_run[0]} && -d $BACKUP ]]; then
    clear
    echo ""
    echo "   A backup has been created here:"
    echo ""
    echo "    $BACKUP"
    echo ""
    echo ""
    echo "  Install Mobile-Friendly-Firefox?"
    echo ""
    echo ""
    echo " y) * Yes *"
    echo " q)   I change my mind; quit."
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        y|Y)
            ;;
        q|Q)
            clear
            exit
            ;;
    esac

#-----------------------------------------------------------------------------------------------

# Backup already exists
elif [[ $FIRST_RUN == ${first_run[1]} && -d $BACKUP ]]; then
    clear
    echo ""
    echo "   You already have a backup here:"
    echo ""
    echo "     $BACKUP"
    echo ""
    echo ""
    echo "  Install Mobile-Friendly-Firefox?"
    echo ""
    echo ""
    echo " y) * Yes *"
    echo " q)   I change my mind; quit."
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        y|Y)
            ;;
        q|Q)
            clear
            exit
            ;;
    esac

#-----------------------------------------------------------------------------------------------

# Backup does not exist
elif [[ ! -d $BACKUP ]]; then
    clear
    echo ""
    echo "No styles existed before first install"
    echo "     so a backup was not created"
    echo ""
    echo ""
    echo ""
    echo "  Install Mobile-Friendly-Firefox?"
    echo ""
    echo ""
    echo " y) * Yes *"
    echo " q)   I change my mind; quit."
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read a;
    case $a in
        y|Y)
            ;;
        q|Q)
            clear
            exit
            ;;
    esac
fi

################################################################################################

# Install recommended user.js preferences to profiles

if [[ $USERJS == ${userjs[0]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        if [[ ! -f $BROWSER/$PROFILE/user.js ]]; then
            echo -e "/** Begin Mobile-Friendly-Firefox Customizations **/" > $BROWSER/$PROFILE/user.js
        elif ! grep -q "Begin Mobile-Friendly-Firefox Customizations" "$BROWSER/$PROFILE/user.js"; then
            echo -e "/** Begin Mobile-Friendly-Firefox Customizations **/" >> $BROWSER/$PROFILE/user.js
        fi
        if ! grep -q "End Mobile-Friendly-Firefox Customizations" "$BROWSER/$PROFILE/user.js"; then
            echo -e "user_pref(\"toolkit.legacyUserProfileCustomizations.stylesheets\", true); // [FF68+] allow userChrome/userContent" >> $BROWSER/$PROFILE/user.js
            echo -e "user_pref(\"browser.tabs.warnOnClose\", true); // Confirm before closing multiple tabs" >> $BROWSER/$PROFILE/user.js
            echo -e "user_pref(\"browser.tabs.closeWindowWithLastTab\", false); // disable closing window with last tap" >> $BROWSER/$PROFILE/user.js
            echo -e "user_pref(\"browser.tabs.allowTabDetach\", false); // disable detachable tabs" >> $BROWSER/$PROFILE/user.js
            echo -e "user_pref(\"nglayout.enable_drag_images\", false); // disable tab preview image on drag" >> $BROWSER/$PROFILE/user.js
            echo -e "user_pref(\"browser.uidensity\", 2); // 0=default, 2=touch" >> $BROWSER/$PROFILE/user.js
            echo -e "/** End Mobile-Friendly-Firefox Customizations **/" >> $BROWSER/$PROFILE/user.js
        fi
    done
fi

################################################################################################

# Install styles to profiles

# Desktop
if [[ $STYLE == ${styles[0]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $DESKTOP $BROWSER/$PROFILE/chrome/
        cp $FILE_00 $BROWSER/$PROFILE/chrome/
        cp $FILE_01 $BROWSER/$PROFILE/chrome/
        cp $FILE_02 $BROWSER/$PROFILE/chrome/
        cp $FILE_03 $BROWSER/$PROFILE/chrome/
        cp $FILE_04 $BROWSER/$PROFILE/chrome/
        cp $FILE_05 $BROWSER/$PROFILE/chrome/
        cp $FILE_06 $BROWSER/$PROFILE/chrome/
        cp $FILE_07 $BROWSER/$PROFILE/chrome/
        cp $FILE_08 $BROWSER/$PROFILE/chrome/
        cp $FILE_09 $BROWSER/$PROFILE/chrome/
        cp $FILE_10 $BROWSER/$PROFILE/chrome/
        cp $FILE_11 $BROWSER/$PROFILE/chrome/
        cp $FILE_12 $BROWSER/$PROFILE/chrome/
        cp $FILE_13 $BROWSER/$PROFILE/chrome/
        cp $FILE_14 $BROWSER/$PROFILE/chrome/
	cp $FILE_15 $BROWSER/$PROFILE/chrome/
        cp $FILE_16 $BROWSER/$PROFILE/chrome/
        cp $FILE_17 $BROWSER/$PROFILE/chrome/
        cp $FILE_18 $BROWSER/$PROFILE/chrome/
        cp $FILE_19 $BROWSER/$PROFILE/chrome/
        cp $FILE_20 $BROWSER/$PROFILE/chrome/
        cp $FILE_21 $BROWSER/$PROFILE/chrome/
        cp $FILE_22 $BROWSER/$PROFILE/chrome/
        cp $FILE_23 $BROWSER/$PROFILE/chrome/
        cp $FILE_24 $BROWSER/$PROFILE/chrome/
        cp $FILE_25 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
        cp $FILE_44 $BROWSER/$PROFILE/chrome/
        cp $FILE_45 $BROWSER/$PROFILE/chrome/
        cp $FILE_46 $BROWSER/$PROFILE/chrome/
    done

# Mobile
elif [[ $STYLE == ${styles[1]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $MOBILE $BROWSER/$PROFILE/chrome/
        cp $FILE_00 $BROWSER/$PROFILE/chrome/
        cp $FILE_01 $BROWSER/$PROFILE/chrome/
        cp $FILE_02 $BROWSER/$PROFILE/chrome/
        cp $FILE_03 $BROWSER/$PROFILE/chrome/
        cp $FILE_04 $BROWSER/$PROFILE/chrome/
        cp $FILE_05 $BROWSER/$PROFILE/chrome/
        cp $FILE_06 $BROWSER/$PROFILE/chrome/
        cp $FILE_07 $BROWSER/$PROFILE/chrome/
        cp $FILE_08 $BROWSER/$PROFILE/chrome/
        cp $FILE_09 $BROWSER/$PROFILE/chrome/
        cp $FILE_10 $BROWSER/$PROFILE/chrome/
        cp $FILE_11 $BROWSER/$PROFILE/chrome/
        cp $FILE_12 $BROWSER/$PROFILE/chrome/
        cp $FILE_13 $BROWSER/$PROFILE/chrome/
        cp $FILE_14 $BROWSER/$PROFILE/chrome/
        cp $FILE_15 $BROWSER/$PROFILE/chrome/
        cp $FILE_16 $BROWSER/$PROFILE/chrome/
        cp $FILE_17 $BROWSER/$PROFILE/chrome/
        cp $FILE_18 $BROWSER/$PROFILE/chrome/
        cp $FILE_19 $BROWSER/$PROFILE/chrome/
        cp $FILE_20 $BROWSER/$PROFILE/chrome/
        cp $FILE_21 $BROWSER/$PROFILE/chrome/
        cp $FILE_23 $BROWSER/$PROFILE/chrome/
        cp $FILE_26 $BROWSER/$PROFILE/chrome/
        cp $FILE_27 $BROWSER/$PROFILE/chrome/
        cp $FILE_28 $BROWSER/$PROFILE/chrome/
        cp $FILE_29 $BROWSER/$PROFILE/chrome/
        cp $FILE_32 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
        cp $FILE_44 $BROWSER/$PROFILE/chrome/
        cp $FILE_45 $BROWSER/$PROFILE/chrome/
        cp $FILE_46 $BROWSER/$PROFILE/chrome/
    done

# True Mobile
elif [[ $STYLE == ${styles[2]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $TRUE_MOBILE $BROWSER/$PROFILE/chrome/
        cp $FILE_00 $BROWSER/$PROFILE/chrome/
        cp $FILE_01 $BROWSER/$PROFILE/chrome/
        cp $FILE_02 $BROWSER/$PROFILE/chrome/
        cp $FILE_03 $BROWSER/$PROFILE/chrome/
        cp $FILE_04 $BROWSER/$PROFILE/chrome/
        cp $FILE_05 $BROWSER/$PROFILE/chrome/
        cp $FILE_06 $BROWSER/$PROFILE/chrome/
        cp $FILE_07 $BROWSER/$PROFILE/chrome/
        cp $FILE_08 $BROWSER/$PROFILE/chrome/
        cp $FILE_09 $BROWSER/$PROFILE/chrome/
        cp $FILE_10 $BROWSER/$PROFILE/chrome/
        cp $FILE_11 $BROWSER/$PROFILE/chrome/
        cp $FILE_12 $BROWSER/$PROFILE/chrome/
        cp $FILE_13 $BROWSER/$PROFILE/chrome/
        cp $FILE_14 $BROWSER/$PROFILE/chrome/
        cp $FILE_15 $BROWSER/$PROFILE/chrome/
        cp $FILE_16 $BROWSER/$PROFILE/chrome/
        cp $FILE_21 $BROWSER/$PROFILE/chrome/
        cp $FILE_23 $BROWSER/$PROFILE/chrome/
        cp $FILE_30 $BROWSER/$PROFILE/chrome/
        cp $FILE_31 $BROWSER/$PROFILE/chrome/
        cp $FILE_32 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
    done

# Fenix
elif [[ $STYLE == ${styles[3]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $FENIX $BROWSER/$PROFILE/chrome/
        cp $FILE_00 $BROWSER/$PROFILE/chrome/
        cp $FILE_01 $BROWSER/$PROFILE/chrome/
        cp $FILE_02 $BROWSER/$PROFILE/chrome/
        cp $FILE_03 $BROWSER/$PROFILE/chrome/
        cp $FILE_04 $BROWSER/$PROFILE/chrome/
        cp $FILE_05 $BROWSER/$PROFILE/chrome/
        cp $FILE_06 $BROWSER/$PROFILE/chrome/
        cp $FILE_07 $BROWSER/$PROFILE/chrome/
        cp $FILE_08 $BROWSER/$PROFILE/chrome/
        cp $FILE_09 $BROWSER/$PROFILE/chrome/
        cp $FILE_10 $BROWSER/$PROFILE/chrome/
        cp $FILE_11 $BROWSER/$PROFILE/chrome/
        cp $FILE_12 $BROWSER/$PROFILE/chrome/
        cp $FILE_13 $BROWSER/$PROFILE/chrome/
        cp $FILE_14 $BROWSER/$PROFILE/chrome/
        cp $FILE_15 $BROWSER/$PROFILE/chrome/
        cp $FILE_21 $BROWSER/$PROFILE/chrome/
        cp $FILE_23 $BROWSER/$PROFILE/chrome/
        cp $FILE_33 $BROWSER/$PROFILE/chrome/
        cp $FILE_34 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
    done

# Fenix Fox
elif [[ $STYLE == ${styles[4]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $FENIX_FOX $BROWSER/$PROFILE/chrome/
        cp $FILE_00 $BROWSER/$PROFILE/chrome/
        cp $FILE_35 $BROWSER/$PROFILE/chrome/
        cp $FILE_36 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
    done

# Fenix One
elif [[ $STYLE == ${styles[5]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        rm -rf $BROWSER/$PROFILE/chrome/
        mkdir $BROWSER/$PROFILE/chrome/
        cp $FENIX_ONE $BROWSER/$PROFILE/chrome/
        cp $FILE_37 $BROWSER/$PROFILE/chrome/
        cp $FILE_38 $BROWSER/$PROFILE/chrome/
        cp $FILE_39 $BROWSER/$PROFILE/chrome/
        cp $FILE_40 $BROWSER/$PROFILE/chrome/
        cp $FILE_41 $BROWSER/$PROFILE/chrome/
        cp $FILE_42 $BROWSER/$PROFILE/chrome/
        cp $FILE_43 $BROWSER/$PROFILE/chrome/
    done
fi

################################################################################################

# Install colors to profiles

# Fenix Colors
if [[ $COLOR == ${colors[1]} ]]; then
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        cp $FENIX_COLORS $BROWSER/$PROFILE/chrome/
    done

    # Desktop, Mobile, True Mobile, & Fenix
    if [[ $STYLE != ${styles[4]} && $STYLE != ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '8 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '10 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Default Colors
else
    for ((i = 0; i < ${#profiles[@]}; ++i)); do
        PROFILE=$(echo "${profiles[$i]}")
        cp $DEFAULT_COLORS $BROWSER/$PROFILE/chrome/
    done
fi

################################################################################################

# Install Nav Bar color option to profiles

# Default Gray
if [[ $NAVBAR == ${navbar[0]} ]]; then

    # Desktop, Mobile, True Mobile, & Fenix
    if [[ $STYLE != ${styles[4]} && $STYLE != ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove / to comment out Private Browsing Mode theme for URL Bar and Nav Bar
            sed -i 's|Private Browsing Mode theme for URL Bar and Nav Bar \*/|Private Browsing Mode theme for URL Bar and Nav Bar \* |g' $BROWSER/$PROFILE/chrome/fenix_colors.css
        done

    # Fenix One Alt
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove / to comment out Private Browsing Mode theme for URL Bar and Nav Bar
            sed -i 's|Private Browsing Mode theme for URL Bar and Nav Bar \*/|Private Browsing Mode theme for URL Bar and Nav Bar \* |g' $BROWSER/$PROFILE/chrome/fenix_one-alt.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove / to comment out Private Browsing Mode theme for URL Bar and Nav Bar
            sed -i 's|Private Browsing Mode theme for URL Bar and Nav Bar \*/|Private Browsing Mode theme for URL Bar and Nav Bar \* |g' $BROWSER/$PROFILE/chrome/fenix_one.css
        done
    fi
fi

################################################################################################

# Install toolbar position to profiles

# Top
if [[ $TOOLBAR == ${toolbars[0]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '14 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '16 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '18 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '22 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '24 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '14 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '16 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '18 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '22 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '24 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '56 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '58 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '60 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '62 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '14 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '16 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '18 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '20 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '46 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '48 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '50 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '14 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '16 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '18 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '20 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '44 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '46 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '48 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '10 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '12 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '14 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '8 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '10 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '12 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Split
elif [[ $TOOLBAR == ${toolbars[1]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '22 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '24 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '22 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '24 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add */
            sed -i '58 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '60 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '62 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi
fi

################################################################################################

# Install theme to profiles

# Fenix theme + Mobile style
if [[ $THEME == ${themes[1]} && $STYLE == ${styles[1]} ]]; then

    # Bottom toolbars
    if [[ $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '62 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '64 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Top or Split toolbars
    else
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '62 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '64 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi
fi

################################################################################################

# Install popup preference to profiles

# Default Popups
if [[ $POPUP == ${popups[0]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '66 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '68 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '70 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '72 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '58 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '60 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '54 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '56 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '20 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '18 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Dynamic Popups
elif [[ $POPUP == ${popups[1]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '60 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '62 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '66 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '68 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '64 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '66 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '70 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '72 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '52 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '54 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '58 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '60 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '48 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '50 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '54 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '56 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '14 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '16 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '20 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '12 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '14 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '18 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Dynamic Popups Plus
elif [[ $POPUP == ${popups[2]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '62 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '64 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '66 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '68 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '66 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '68 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '70 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '72 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '54 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '56 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '58 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '60 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '50 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '52 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '54 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '56 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '16 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '18 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '20 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '14 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '16 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '18 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Dynamic Popups Max
elif [[ $POPUP == ${popups[3]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '64 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '66 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '68 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '68 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '70 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '72 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '56 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '58 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '60 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '52 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '54 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '56 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '18 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '20 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '22 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add */
            sed -i '16 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '18 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '20 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Dynamic Popups Pro Max
elif [[ $POPUP == ${popups[5]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '66 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '68 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '70 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '70 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '72 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Add /*
            sed -i '74 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '58 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '60 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '62 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '54 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '56 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '58 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '20 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '22 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '24 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove */
            sed -i '18 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '20 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '22 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi
fi

################################################################################################

# Install newtab preference to profiles

# Hide New-Tab Button
if [[ $NEWTAB == ${newtab[0]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '46 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace */ with /*
            sed -i '48 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove /*
            sed -i '50 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Show New-Tab Button
elif [[ $NEWTAB == ${newtab[1]} ]]; then

    # Mobile
    if [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add /*
            sed -i '46 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Replace /* with */
            sed -i '48 s|/\*|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '50 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done
    fi
fi

################################################################################################

# Install tabmanager preference to profiles

# Show Tab Manager Menu Button
if [[ $TABMANAGER == ${tabmanager[1]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        if [[ $NEWTAB == ${newtab[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add */
                sed -i '50 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
                # Replace */ with /*
                sed -i '52 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove /*
                sed -i '54 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        elif [[ $NEWTAB == ${newtab[1]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '50 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Replace */ with /*
                sed -i '52 s|\*/|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove /*
                sed -i '54 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        fi
    fi
fi

################################################################################################

# Install back-button preference to profiles

# Hide Back Button
if [[ $BACK == ${back[0]} ]]; then

    # Desktop, Mobile, True Mobile, & Fenix
    if [[ $STYLE != ${styles[4]} && $STYLE != ${styles[5]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Replace /* #back-button */ with #back-button,
            sed -i 's|/\* \#back-button \*/|\#back-button,|g' $BROWSER/$PROFILE/chrome/urlbar.css
        done
    fi

#-----------------------------------------------------------------------------------------------

# Show Back Button
elif [[ $BACK == ${back[1]} ]]; then

    # Fenix Fox Alt
    if [[ $STYLE == ${styles[4]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Replace #back-button, with /* #back-button */
            sed -i 's|\#back-button,|/\* \#back-button \*/|g' $BROWSER/$PROFILE/chrome/fenix_fox-alt.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Replace #back-button, with /* #back-button */
            sed -i 's|\#back-button,|/\* \#back-button \*/|g' $BROWSER/$PROFILE/chrome/fenix_fox.css
        done

    # Fenix One Alt
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Replace #back-button, with /* #back-button */
            sed -i 's|\#back-button,|/\* \#back-button \*/|g' $BROWSER/$PROFILE/chrome/fenix_one-alt.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Replace #back-button, with /* #back-button */
            sed -i 's|\#back-button,|/\* \#back-button \*/|g' $BROWSER/$PROFILE/chrome/fenix_one.css
        done
    fi
fi

################################################################################################

# Install extensions preference to profiles

# Hide Unified Extensions Menu Button
if [[ $EXTENSIONS == ${extensions[0]} ]]; then

    # Desktop
    if [[ $STYLE == ${styles[0]} ]]; then
        if [[ $TABMANAGER == ${tabmanager[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '54 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove */
                sed -i '56 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        elif [[ $TABMANAGER == ${tabmanager[1]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add */
                sed -i '54 s|^$|\*/|' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove */
                sed -i '56 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        fi

    # Mobile
    elif [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Remove /*
            sed -i '52 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
            # Remove */
            sed -i '54 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
        done

    # True Mobile
    elif [[ $STYLE == ${styles[2]} ]]; then
        if [[ $TOOLBAR == ${toolbars[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '44 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove */
                sed -i '46 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        elif [[ $TOOLBAR == ${toolbars[2]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '44 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Add /*
                sed -i '46 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        fi

    # Fenix
    elif [[ $STYLE == ${styles[3]} ]]; then
        if [[ $TOOLBAR == ${toolbars[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '42 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Remove */
                sed -i '44 s|\*/||' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        elif [[ $TOOLBAR == ${toolbars[2]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Remove /*
                sed -i '42 s|/\*||' $BROWSER/$PROFILE/chrome/userChrome.css
                # Add /*
                sed -i '44 s|^$|/\*|' $BROWSER/$PROFILE/chrome/userChrome.css
            done
        fi

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} ]]; then
        if [[ $TOOLBAR == ${toolbars[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add / to uncomment Hide Unified Extensions Menu button
                sed -i 's|Hide Unified Extensions Menu button \* |Hide Unified Extensions Menu button \*/|' $BROWSER/$PROFILE/chrome/fenix_fox-alt.css
            done
        elif [[ $TOOLBAR == ${toolbars[2]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add / to uncomment Hide Unified Extensions Menu button
                sed -i 's|Hide Unified Extensions Menu button \* |Hide Unified Extensions Menu button \*/|' $BROWSER/$PROFILE/chrome/fenix_fox.css
            done
        fi

    # Fenix One
    elif [[ $STYLE == ${styles[5]} ]]; then
        if [[ $TOOLBAR == ${toolbars[0]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add / to uncomment Hide Unified Extensions Menu button
                sed -i 's|Hide Unified Extensions Menu button \* |Hide Unified Extensions Menu button \*/|' $BROWSER/$PROFILE/chrome/fenix_one-alt.css
            done
        elif [[ $TOOLBAR == ${toolbars[2]} ]]; then
            for ((i = 0; i < ${#profiles[@]}; ++i)); do
                PROFILE=$(echo "${profiles[$i]}")
                # Add / to uncomment Hide Unified Extensions Menu button
                sed -i 's|Hide Unified Extensions Menu button \* |Hide Unified Extensions Menu button \*/|' $BROWSER/$PROFILE/chrome/fenix_one.css
            done
        fi
    fi
fi

################################################################################################

# Install unified extensions menu button icon option to profiles

# Home icon
if [[ $ICON == ${icon[1]} ]]; then

    # Mobile Style + Fenix Theme
    if [[ $STYLE == ${styles[1]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix_theme.css
        done

    # Fenix Alt
    elif [[ $STYLE == ${styles[3]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix-alt.css
        done

    # Fenix
    elif [[ $STYLE == ${styles[3]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix.css
        done

    # Fenix Fox Alt
    elif [[ $STYLE == ${styles[4]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix_fox-alt.css
        done

    # Fenix Fox
    elif [[ $STYLE == ${styles[4]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix_fox.css
        done

    # Fenix One Alt
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[0]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix_one-alt.css
        done

    # Fenix One
    elif [[ $STYLE == ${styles[5]} && $TOOLBAR == ${toolbars[2]} ]]; then
        for ((i = 0; i < ${#profiles[@]}; ++i)); do
            PROFILE=$(echo "${profiles[$i]}")
            # Add / to uncomment Change Unified Extensions Menu button icon to Home button icon
            sed -i 's|Change Unified Extensions Menu button icon to Home button icon \* |Change Unified Extensions Menu button icon to Home button icon \*/|g' $BROWSER/$PROFILE/chrome/fenix_one.css
        done
    fi
fi

################################################################################################

# Inform user of successful install

if [[ -d $BACKUP ]]; then
    clear
    echo ""
    echo " Mobile-Friendly-Firefox has installed"
    echo ""
    echo " This install script can be run again"
    echo "   and a new style can be choosen"
    echo ""
    echo "  Remember that your backup is here:"
    echo ""
    echo "     $BACKUP"
    echo ""
    echo " The uninstall script will restore it"
    echo ""
    echo "      * Press any key to finish *"
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

elif [[ ! -d $BACKUP ]]; then
    clear
    echo ""
    echo " Mobile-Friendly-Firefox has installed"
    echo ""
    echo " This install script can be run again"
    echo "   and a new style can be choosen"
    echo ""
    echo " Since no styles were already in use"
    echo "when the install script was first run"
    echo "no chrome.backup directory was created"
    echo ""
    echo "   The uninstall script will remove"
    echo "   all styles from selected browser"
    echo ""
    echo "      * Press any key to finish *"
    echo ""
    echo ""
    read a;
    case $a in
        *)
            clear
            ;;
    esac
fi

exit

################################################################################################
