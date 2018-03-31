#!/bin/bash

RASPI_ADDRESS=${RASPI_ADDRESS:="{{raspi_address}}"}
RASPI_USER=${RASPI_USER:="{{raspi_user}}"}
SYSROOT_DIR="{{toolsdir}}/raspberrypi-qt/sysroot/"

mkdir -p "$SYSROOT_DIR"

rsync -avzR --delete $RASPI_USER@$RASPI_ADDRESS:/lib :/usr/include :/usr/lib :/opt/vc "$SYSROOT_DIR"

sysroot-relativelinks "$SYSROOT_DIR"

tar cfj "{{homedir}}/raspi_sysroot.tbz2" "$SYSROOT_DIR"
