#!/usr/local/bin/bash
# =============================================================================
# ~/.xsession
# =============================================================================

# === From /etc/X11/xinit/xinitrc =============================================
USERRESOURCES=$HOME/.Xresources
SYSRESOURCES=/etc/X11/xinit/.Xresources

if [ -f $SYSRESOURCES ]; then
    xrdb -merge $SYSRESOURCES
fi

if [ -f "$USERRESOURCES" ]; then
    xrdb -merge "$USERRESOURCES"
fi

# === Window Maker-related X session setup ====================================
export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/bin"

exec wmaker

# =============================================================================
# vim:set nu et ts=4 sw=4:
# =============================================================================
