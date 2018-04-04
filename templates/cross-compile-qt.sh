#!/bin/bash

RASPI_VERSION=linux-rasp-pi2-g++
SYSROOT_DIR="{{toolsdir}}/raspberrypi-qt/sysroot/"

cd "{{toolsdir}}/qt/{{qt_version}}/Src/"
./configure -release -opengl es2 -device $RASPI_VERSION -device-option CROSS_COMPILE="{{toolsdir}}/raspberrypi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-" -sysroot "$SYSROOT_DIR" -opensource -confirm-license -make libs -make tools -prefix /usr/local/qt -extprefix "{{toolsdir}}/raspberrypi-qt/qt5pi/" -hostprefix "{{toolsdir}}/raspberrypi-qt/qt5/" -no-use-gold-linker -skip qtwebengine -v

make -j8
make install

pushd "{{toolsdir}}/raspberrypi-qt/qt5pi/"
tar cfj "{{homedir}}/raspi_qt-{{qt_version}}.tbz2" "."
popd
