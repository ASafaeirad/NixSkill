{ config, pkgs, ... }:

{
  xdg.configFile."X11/xinitrc".text = ''
    #!/bin/sh

    if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
     eval $(dbus-launch --exit-with-session --sh-syntax)
    fi

    systemctl --user import-environment DISPLAY XAUTHORITY

    if command -v dbus-update-activation-environment >/dev/null 2>&1; then
     dbus-update-activation-environment DISPLAY XAUTHORITY
    fi

    xrdb -merge $XDG_CONFIG_HOME/X11/Xresources

    eval $(gnome-keyring-daemon --start) &
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

    xset b off
    picom -b
    nitrogen --restore &
    copyq &
    restart-flashfocus &
    sxhkd &
    notion-app-enhanced &

    exec awesome
  '';
}
