#!/bin/bash

# After ./esp-idf/export.sh
source ./tools/config.sh

if [ ! -d "$MATTER_PATH" ]; then
    # for using a branch we need no full clone
    echo "ESP-MATTER is not installed! Installing..."
    git clone --depth 1 https://github.com/espressif/esp-matter.git --recurse-submodules --shallow-submodules
else
    # update existing branch
    echo "ESP-MATTER is already installed, updating the master branch"
    cd $MATTER_PATH
    git pull
    git reset --hard
    git submodule update --depth 1
    # -ff is for cleaning untracked files as well as submodules
    git clean -ffdx
    cd -
fi

cd $MATTER_PATH/connectedhomeip/connectedhomeip
./scripts/checkout_submodules.py --platform esp32 linux --shallow #darwin for macos
cd ../../..
$MATTER_PATH/install.sh
source $MATTER_PATH/export.sh
