#!/bin/bash

sudo apt update && sudo apt install -y git wget curl libssl-dev libncurses-dev flex bison gperf python3 cmake ninja-build ccache
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && \
pip3 install setuptools pyserial click future wheel cryptography pyparsing pyelftools

# Check if the system is macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Detected macOS. Checking Homebrew installation..."

	# Install Homebrew if it is not already installed
	if ! command -v brew &> /dev/null; then
		echo "Homebrew not found. Installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	brew install gsed
	brew install gawk
	brew install gperf
	brew install ninja
	brew install ccache
else
	echo "This script is meant for macOS. Current OS: $OSTYPE."
fi
