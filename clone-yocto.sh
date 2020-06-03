#!/usr/bin/env bash

set -e

usage() {
  echo "Usage: $0 <target-directory>"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

directory=$1

if [ -e "${directory}" ]; then
  echo "Error: \"${directory}\" already exists."
  usage
fi

# create the directory
mkdir -p "${directory}/sources" && cd "${directory}"

# clone poky and other layers
git clone -b warrior git://git.yoctoproject.org/poky.git sources/poky
git clone -b warrior https://github.com/Freescale/meta-freescale.git sources/meta-freescale
git clone -b warrior https://github.com/Freescale/meta-freescale-3rdparty.git sources/meta-freescale-3rdparty
git clone -b warrior https://github.com/Freescale/meta-freescale-distro.git sources/meta-freescale-distro
git clone -b warrior https://github.com/openembedded/meta-openembedded.git sources/meta-openembedded

echo "Done, type \"cd ${directory} && . ./sources/poky/oe-init-build-env\" to create the build environment"
