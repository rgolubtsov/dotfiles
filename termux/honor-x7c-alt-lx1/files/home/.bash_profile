# =============================================================================
# ~/.bash_profile
# =============================================================================

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Do we need to start X session?
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && ! [[ -e /tmp/.X11-unix/X0 ]]; then
    while true; do
        echo

        read -p ":: Do you want to start X11 ? (y/n): "

        case $REPLY in
            [yY]) exec startx ;;

            [nN]) break ;;

            *) printf "%s\n" ":: Please answer [Yes] or [No]." ;;
        esac
    done
fi

# =============================================================================
# vim:set nu et ts=4 sw=4:
# =============================================================================
