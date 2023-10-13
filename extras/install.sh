#!/bin/bash

ORIGIN_REPO="https://github.com/${GIT_OWNER:-mrworf}/plexupdate"
FULL_PATH="/opt/plexupdate"
CONFIGFILE="/etc/plexupdate.conf"
CONFIGCRON="/etc/plexupdate.cron.conf"
CRONWRAPPER="/etc/cron.daily/plexupdate"
VERBOSE=yes

# Default options
AUTOINSTALL=yes
AUTOUPDATE=yes
PUBLIC=
DISTRO_INSTALL="apt install"  # Default distro installation command

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

configure_plexupdate() {
    # Configuration logic here (assuming default values for now)
}

configure_cron() {
    # Configuration logic here (assuming default values for now)
}

# Installation logic
install_plexupdate
configure_plexupdate
configure_cron

# Run plexupdate with the configured settings
echo "Running plexupdate with the configured settings... "
"$FULL_PATH/plexupdate.sh" --config "$CONFIGFILE"

