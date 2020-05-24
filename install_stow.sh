#!/bin/bash

set -e

echo "This script is meant to be a fallback if you are unable to install stow via the system package manager."
echo "It will install stow in userspace, provided appropriate versions of perl and make are available."
while true; do
    read -p "Install stow with this script instead of the system package manager? (y/n): " yn
    case $yn in
        [Yy]* ) true; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done

# This should be the ~/dotfiles dir, most likely
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# This is the dir we'll install stow into
STOW_PREFIX_DIR="$SCRIPT_DIR/local/.local"

# https://unix.stackexchange.com/questions/30091/fix-or-alternative-for-mktemp-in-os-x
MY_TMP_DIR="$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')"
echo "Created tmpdir at $MY_TMP_DIR. If script fails it will need to be manually removed."

echo "Downloading and extracting stow source..."
cd "$MY_TMP_DIR"
curl https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz > "$MY_TMP_DIR/stow-latest.tar.gz"
STOW_SRC_DIR="$(dirname $(tar xzfv $MY_TMP_DIR/stow-latest.tar.gz | tail -n 1))"
rm "$MY_TMP_DIR/stow-latest.tar.gz"
cd "$STOW_SRC_DIR"
echo "Installing stow..."
./configure --prefix="$STOW_PREFIX_DIR"
make install
echo "Removing $MY_TMP_DIR..."
rm -r "$MY_TMP_DIR"
echo "Stow available at: $STPW_PRPEFIX_DIR/bin/stow"
echo "Stowing the local and bashrc directories will place stow in your path after restarting your terminal."
echo "eg: "
echo "$ $STOW_PREFIX_DIR/bin/stow bashrc"
echo "$ $STOW_PREFIX_DIR/bin/stow local"
echo "$ # Restart your terminal"
echo "$ stow --version"
