#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

USERNAME=$(whoami)

USE_SUDO=''
if [ "$USERNAME" != "root" ];
then
  USE_SUDO="sudo "
fi

echo "User: ${USERNAME}"
echo "Sudo: ${USE_SUDO}"

# Do we need to install SaltStack?
if ! command -v salt-call > /dev/null 2>&1 ;
then
    echo "We need SaltStack ..."
    # -X Do not start daemons after installation
    # -P Allow pip based installations. On some distributions the required salt
    #    packages or its dependencies are not available as a package for that
    #    distribution. Using this flag allows the script to use pip as a last
    #    resort method. NOTE: This only works for functions which actually
    #    implement pip based installations.
    ${USE_SUDO} sh bootstrap-salt.sh -X -P stable
fi

# Set the user, home-directory, and state root
$USE_SUDO salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"${HOME}\" }"

pwd
ls /home/vagrant/

# Apply the high state
$USE_SUDO salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.highstate
