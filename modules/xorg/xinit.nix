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

    # eval $(gnome-keyring-daemon --start) &
    xset b off
    nitrogen --restore &
    copyq &
    restart-flashfocus &
    sxhkd &
    notion-app-enhanced &

    exec awesome
  '';
}
