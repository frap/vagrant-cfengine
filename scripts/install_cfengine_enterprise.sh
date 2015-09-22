#!/bin/bash
TYPE=$1
PACKAGE_RELEASE=$2
PACKAGE_BUILD=$3


echo "Checking for CFEngine Enterprise $TYPE"
if [[ $TYPE == "agent" ]]; then
    if $(/bin/rpm --query --quiet cfengine-nova); then
        echo "CFEngine Enterprise $TYPE is already installed"
    else
        echo "Installing CFEngine Enterprise $TYPE"
        rpm -i "/vagrant/packages/cfengine-nova-$PACKAGE_RELEASE-$PACKAGE_BUILD.x86_64.rpm"
    fi
elif [[ $TYPE == "hub" ]]; then
    if $(/bin/rpm --query --quiet cfengine-nova-hub); then
        echo "CFEngine Enterprise $TYPE is already installed"
    else
        echo "Installing CFEngine Enterprise $TYPE"
        rpm -i "/vagrant/packages/cfengine-nova-hub-$PACKAGE_RELEASE-$PACKAGE_BUILD.x86_64.rpm"
    fi
else
  echo "'$TYPE' is not a valid CFEngine package type."
fi
