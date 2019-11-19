#!/bin/bash

set -o verbose

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -qq update
sudo apt-get -y install gcc-8 g++-8 gcc-8-multilib g++-8-multilib
sudo apt-get install mesa-common-dev:i386 libxxf86dga-dev:i386 libasound2-dev:i386 libxrandr-dev:i386 libxxf86vm-dev:i386 libbsd-dev:i386
sudo apt-get install p7zip-full

# Build ETe

#export BUILD_CONFIGURATION="Debug"
export BUILD_CONFIGURATION="Release"
export CC="gcc-8 -m32"
export CXX="g++-8 -m32"

cd code
if [[ "$BUILD_CONFIGURATION" == "Release" ]] ; then
    cmake . && make || exit 1
elif [[ "$BUILD_CONFIGURATION" == "Debug" ]] ; then
    cmake . && make || exit 1
else
    exit 1
fi

ls -R *.so

echo "$TRAVIS_TAG"
echo "$BUILD_CONFIGURATION"

7z a "$TRAVIS_BUILD_DIR/etf-linux-$TRAVIS_TAG-$BUILD_CONFIGURATION.x86.7z" *.so
