#!/bin/sh
# =============================================================================
# ~/.xinitrc
# =============================================================================

# === From /etc/X11/xinit/xinitrc =============================================
USERRESOURCES=$HOME/.Xresources
USERMODMAP=$HOME/.Xmodmap
SYSRESOURCES=/etc/X11/xinit/.Xresources
SYSMODMAP=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps.
if [ -f $SYSRESOURCES ]; then
    xrdb -merge $SYSRESOURCES
fi

if [ -f $SYSMODMAP ]; then
    xmodmap $SYSMODMAP
fi

if [ -f "$USERRESOURCES" ]; then
    xrdb -merge "$USERRESOURCES"
fi

if [ -f "$USERMODMAP" ]; then
    xmodmap "$USERMODMAP"
fi

# Start some nice programs.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done

    unset f
fi

# === By /usr/bin/wmaker.inst =================================================
# Window Maker default X session startup script.

PATH="$PATH:/usr/bin"

# If you login from xdm, uncomment this to make error messages appear
# in the console window.
#
# tail -f "/home/yaroslav"/.xsession-errors > /dev/console &

exec wmaker

# =============================================================================
# vim:set nu:et:ts=4:sw=4:
# =============================================================================
