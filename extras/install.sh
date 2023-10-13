#!/bin/bash

ORIGIN_REPO="https://github.com/${GIT_OWNER:-mrworf}/plexupdate"
FULL_PATH="${PLEXUPDATE_PATH:-/opt/plexupdate}"
VERBOSE="${PLEXUPDATE_VERBOSE:-yes}"

# Default options
AUTOINSTALL="${PLEXUPDATE_AUTOINSTALL:-yes}"
AUTOUPDATE="${PLEXUPDATE_AUTOUPDATE:-yes}"
PUBLIC="${PLEXUPDATE_PUBLIC:-}"

install_plexupdate() {
    if [ ! -d "${FULL_PATH}/.git" ]; then
        echo "Cloning plexupdate repository into '$FULL_PATH'... "
        git clone --branch "${BRANCHNAME:-master}" "$ORIGIN_REPO" "$FULL_PATH" || exit 1
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
"$FULL_PATH/plexupdate.sh"
