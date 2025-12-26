#!/bin/bash

echo "RFX: env : START"
env
echo "RFX: env : END"

ARCH=$CRAFT_ARCH_TRIPLET_BUILD_FOR

THEME=`gsettings get org.gnome.desktop.interface gtk-theme`
case $THEME in
  *"Adwaita"*) ;;
  *"Ambiance"*) ;;
  *"HighContrast"*) ;;
  *"Radiance"*) ;;
  *"Yaru"*) ;;
  *)
    echo "Irregular theme <$THEME>. Using Adwaita"
    export GTK_THEME=Adwaita
    ;;
esac

# Based on https://github.com/Ubuntu/snappy-playpen/blob/master/plank/launcher

# XDG Config
export XDG_CONFIG_HOME=$SNAP_USER_DATA/.config
export XDG_CONFIG_DIRS=$SNAP/etc:$XDG_CONFIG_DIRS
mkdir -p $XDG_CONFIG_HOME

#migrate config
if [ ! -f $XDG_CONFIG_HOME/onlyoffice/DesktopEditors.conf ]; then
  mkdir -p $XDG_CONFIG_HOME/onlyoffice
  LAST_CONFIG=$(ls -a -t $SNAP_USER_DATA | grep .config- | head -1)
  if [ ! -z "${LAST_CONFIG}" ]; then
    mv $SNAP_USER_DATA/$LAST_CONFIG/onlyoffice/DesktopEditors.conf $XDG_CONFIG_HOME/onlyoffice
  fi
fi

# Note: this doesn't seem to work, QML's LocalStorage either ignores
# or fails to use $SNAP_USER_DATA if defined here
export XDG_DATA_DIRS=$SNAP/usr/share:$XDG_DATA_DIRS

# Set XDG_DATA_HOME to local path, dependent on snap version
export XDG_DATA_HOME=$SNAP_USER_DATA/.local/share
export XDG_DATA_DIRS=$XDG_DATA_HOME:$XDG_DATA_DIRS
mkdir -p $XDG_DATA_HOME

#migrate recent files
if [ ! -f $XDG_DATA_HOME/recently-used.xbel ]; then
  mkdir -p $XDG_DATA_HOME/onlyoffice/desktopeditors
  LAST_LOCAL=$(ls -a -t $SNAP_USER_DATA | grep .local- | head -1)
  if [ ! -z "${LAST_LOCAL}" ]; then
    LAST_LOCAL_RECENTLY_USED=$SNAP_USER_DATA/$LAST_LOCAL/share/recently-used.xbel
    if [ -f $LAST_LOCAL_RECENTLY_USED ]; then
      mv $LAST_LOCAL_RECENTLY_USED $XDG_DATA_HOME
    fi
    LAST_LOCAL_RECENTS=$SNAP_USER_DATA/$LAST_LOCAL/share/onlyoffice/desktopeditors/recents.xml
    if [ -f $LAST_LOCAL_RECENTS ]; then
      mv $LAST_LOCAL_RECENTS $XDG_DATA_HOME/onlyoffice/desktopeditors
    fi
  fi
fi

# Set cache folder to local path, dependent on snap version
export XDG_CACHE_HOME=$SNAP_USER_DATA/.cache-$SNAP_VERSION
mkdir -p $XDG_CACHE_HOME

# Not good, needed for fontconfig and themes
ln -sf $SNAP/usr/share/{fontconfig,fonts,themes} $XDG_DATA_HOME

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
  $SNAP/usr/bin/update-mime-database $XDG_DATA_HOME/mime
fi

# Keep an array of data dirs, for looping through them
IFS=':' read -r -a data_dirs_array <<< "$XDG_DATA_DIRS"

# Setup compiled gsettings schema
GS_SCHEMA_DIR=$XDG_DATA_HOME/glib-2.0/schemas

if [ ! -d $GS_SCHEMA_DIR ]; then
  mkdir -p $GS_SCHEMA_DIR
  for d in "${data_dirs_array[@]}"; do
    ln -sf $d/glib-2.0/schemas/*.xml $GS_SCHEMA_DIR
  done

  $SNAP/usr/lib/$ARCH/glib-2.0/glib-compile-schemas $GS_SCHEMA_DIR
fi

# Create $XDG_RUNTIME_DIR if it doesn't exist
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
	mkdir -p $XDG_RUNTIME_DIR -m 700
fi

#Create cache for input methods
export GTK_IM_MODULE_FILE=$XDG_CACHE_HOME/immodules.cache
if [ ! -f $GTK_IM_MODULE_FILE ]; then
  $SNAP/usr/lib/$ARCH/libgtk-3-0t64/gtk-query-immodules-3.0 --update-cache
fi

unset SESSION_MANAGER

cd $SNAP/opt/onlyoffice/desktopeditors/

exec ./DesktopEditors "$@"
