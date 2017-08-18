#!/bin/bash

# This script is for installing CloudCompare with `snapd` on a linux Ubuntu virtual machine
# Created by Tyson L. Swetnam 8/18/2017
# email: tswetnam@cyverse.org

# install Snapd https://snapcraft.io/docs/core/install

echo "Install Snapd https://snapcraft.io/docs/core/install"

sudo apt install -y snapd

echo "Install CloudCompare with Snap"

sudo snap install cloudcompare

sudo snap refresh cloudcompare --edge

sudo snap connect cloudcompare:removable-media :removable-media

# Print

echo "To use Cloudcompare from the command line see: http://www.cloudcompare.org/doc/wiki/index.php?title=Command_line_mode"
