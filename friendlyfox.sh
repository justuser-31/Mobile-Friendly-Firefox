#!/bin/sh

####################################
# Copyright 2024 user0             #
# SPDX-License-Identifier: MPL-2.0 #
################################################################################################

# System shells file

SHELLS=/etc/shells

################################################################################################

# Inform user to install bash

if ! grep -q "bash" "$SHELLS"; then
    printf "\n"
    printf "   The bash shell must be installed\n"
    printf "      before running this script\n"
    printf "\n"
    printf "      * Press any key to exit *\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\n"
    read a;
    case $a in
        *)
            clear
            exit
            ;;
    esac
fi

################################################################################################

# Directory

# Mobile-Friendly-Firefox directory
REPO=$(find ~/ -ipath '*/Mobile-Friendly-Firefox' 2>/dev/null)

################################################################################################

# Run bash command

bash $REPO/$@

################################################################################################
