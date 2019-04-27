#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

USERNAME=$(whoami)

USE_SUDO=''
if [ "$USERNAME" != "root" ];
then
    USE_SUDO="sudo "
fi

echo "User: ${USERNAME}"
echo "Sudo: ${USE_SUDO}"

if [[ $(uname) == 'Darwin' ]];
then
    if ! command -v brew > /dev/null 2>&1;
    then
        echo "Homebrew not found. Installing ..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Do we need to install SaltStack?
    if ! command -v salt-call > /dev/null 2>&1;
    then
        echo "SaltStack not found. Installing ..."
        brew install saltstack
    fi
else
    # Do we need to install SaltStack?
    if ! command -v salt-call > /dev/null 2>&1 ;
    then
        echo "We need SaltStack"
        # -X Do not start daemons after installation
        # -P Allow pip based installations. On some distributions the required salt
        #    packages or its dependencies are not available as a package for that
        #    distribution. Using this flag allows the script to use pip as a last
        #    resort method. NOTE: This only works for functions which actually
        #    implement pip based installations.
        ${USE_SUDO} sh bootstrap-salt.sh -X -P stable
    else
        echo "SaltStack already installed"
    fi
fi

# Set the user, home-directory, and state root
$USE_SUDO salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"${HOME}\" }"

# Apply the high state
$USE_SUDO salt-call --local --config=./ --retcode-passthrough state.highstate
