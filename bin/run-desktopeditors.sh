#!/bin/sh

export FONTCONFIG_PATH=$SNAP/etc/fonts
export FONTCONFIG_FILE=$SNAP/etc/fonts/fonts.conf
#export XDG_DATA_HOME=$SNAP/usr/share
export LD_LIBRARY_PATH=$SNAP/opt/onlyoffice/desktopeditors:$SNAP/opt/onlyoffice/desktopeditors/converter:$LD_LIBRARY_PATH
export LD_PRELOAD=$SNAP/opt/onlyoffice/desktopeditors/libcef.so

cd $SNAP/opt/onlyoffice/desktopeditors/

exec ./DesktopEditors "$@"
