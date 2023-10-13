#!/bin/bash

ORIGIN_REPO="https://github.com/mrworf/plexupdate"  # Default GitHub repository
FULL_PATH="/opt/plexupdate"  # Default installation directory

# Function to install plexupdate
install_plexupdate() {
    if [ ! -d "${FULL_PATH}/.git" ]; then
        echo "Cloning plexupdate repository into '$FULL_PATH'... "
        git clone --branch "master" "$ORIGIN_REPO" "$FULL_PATH" || exit 1
        echo "Clone completed."
    else
        echo "Plexupdate repository already exists in '$FULL_PATH', updating... "
        cd "$FULL_PATH" || exit 1
        git pull || exit 1
        echo "Update completed."
        cd - || exit 1
    fi
}

# Installation logic
install_plexupdate

# Run plexupdate with the configured settings
echo "Running plexupdate with the configured settings... "
"$FULL_PATH/plexupdate.sh" --config "/etc/plexupdate.conf"
