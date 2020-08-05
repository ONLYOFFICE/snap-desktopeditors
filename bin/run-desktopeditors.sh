#!/bin/bash

ARCH=x86_64-linux-gnu

export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/gtk-2.0/modules:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/pulseaudio:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$SNAP/opt/onlyoffice/desktopeditors:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$SNAP/opt/onlyoffice/desktopeditors/converter:$LD_LIBRARY_PATH

export LD_PRELOAD=$SNAP/opt/onlyoffice/desktopeditors/libcef.so

if [ $EUID != 0 ]; then
    HOME_DIR=/home/${USER}
else
    HOME_DIR=/root/
fi

export HOME=${HOME_DIR}

# Based on https://github.com/Ubuntu/snappy-playpen/blob/master/plank/launcher

# XKB config
export XKB_CONFIG_ROOT=$SNAP/usr/share/X11/xkb

# XDG Config
export XDG_CONFIG_DIRS=$SNAP/etc:$XDG_CONFIG_DIRS

# Note: this doesn't seem to work, QML's LocalStorage either ignores
# or fails to use $SNAP_USER_DATA if defined here
export XDG_DATA_DIRS=$SNAP/usr/share:$XDG_DATA_DIRS

# Font Config
export FONTCONFIG_PATH=$SNAP/etc/fonts/config.d
export FONTCONFIG_FILE=$SNAP/etc/fonts/fonts.conf

# Tell libGL where to find the drivers
export LIBGL_DRIVERS_PATH=$SNAP/usr/lib/$ARCH/dri

# Necessary for the SDK to find the translations directory
export APP_DIR=$SNAP

# Set XDG_DATA_HOME to local path, dependent on snap version
export XDG_DATA_HOME=$SNAP_USER_DATA/.local-$SNAP_VERSION/share
export XDG_DATA_DIRS=$XDG_DATA_HOME:$XDG_DATA_DIRS
mkdir -p $XDG_DATA_HOME

# Set cache folder to local path, dependent on snap version
export XDG_CACHE_HOME=$SNAP_USER_DATA/.cache-$SNAP_VERSION
mkdir -p $XDG_CACHE_HOME

# Setup GI Repository typelibs (needed as some packages doesn't support multiarch)
export GI_TYPELIB_PATH=$SNAP/usr/lib/$ARCH/girepository-1.0:$SNAP/usr/lib/girepository-1.0

# Not good, needed for fontconfig and themes
ln -sf $SNAP/usr/share/{fontconfig,fonts,fonts-*,themes} $XDG_DATA_HOME

# Gio modules and cache
export GIO_MODULE_DIR=$XDG_CACHE_HOME/gio-modules

if [ ! -d $GIO_MODULE_DIR ]; then
  mkdir -p $GIO_MODULE_DIR
  ln -s $SNAP/usr/lib/$ARCH/gio/modules/*.so $GIO_MODULE_DIR
  $SNAP/usr/lib/$ARCH/glib-2.0/gio-querymodules $GIO_MODULE_DIR
fi

# Build mime.cache
if [ ! -d $XDG_DATA_HOME/mime ]; then
  cp -a $SNAP/usr/share/mime $XDG_DATA_HOME
  update-mime-database $XDG_DATA_HOME/mime
fi

# Setup GDK pixbuf loaders
export GDK_PIXBUF_MODULE_FILE=$XDG_CACHE_HOME/gdk-pixbuf-loaders.cache
export GDK_PIXBUF_MODULEDIR=$SNAP/usr/lib/$ARCH/gdk-pixbuf-2.0/2.10.0/loaders

if [ ! -e $GDK_PIXBUF_MODULE_FILE ]; then
  $SNAP/usr/lib/$ARCH/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders > $GDK_PIXBUF_MODULE_FILE
fi

# Keep an array of data dirs, for looping through them
IFS=':' read -r -a data_dirs_array <<< "$XDG_DATA_DIRS"

#echo "XDG_DATA_DIRS="$XDG_DATA_DIRS

# Setup compiled gsettings schema
GS_SCHEMA_DIR=$XDG_DATA_HOME/glib-2.0/schemas

if [ ! -d $GS_SCHEMA_DIR ]; then
  mkdir -p $GS_SCHEMA_DIR
  for d in "${data_dirs_array[@]}"; do
    ln -s $d/glib-2.0/schemas/*.xml $GS_SCHEMA_DIR
  done

  $SNAP/usr/lib/$ARCH/glib-2.0/glib-compile-schemas $GS_SCHEMA_DIR
fi

export LC_ALL=C.UTF-8

# Icon themes cache
#if [ ! -d $XDG_DATA_HOME/icons ]; then
#  mkdir -p $XDG_DATA_HOME/icons
#  for d in "${data_dirs_array[@]}"; do
#    for i in $d/icons/*; do
#      if [ -d "$i" ]; then
#        theme_dir=$XDG_DATA_HOME/icons/$(basename "$i")
#        mkdir -p "$theme_dir"
#        ln -s $i/* "$theme_dir"
#        $SNAP/usr/sbin/update-icon-caches "$theme_dir"
#        gtk-update-icon-cache-3.0 "$theme_dir"
#      fi
#    done
#  done
#fi

cd $SNAP/opt/onlyoffice/desktopeditors/

exec ./DesktopEditors "$@"
