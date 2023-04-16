{ config, pkgs, user, locale, timezone, ... }:

{
  programs.zsh.loginShellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
       exec awesome
    fi
  '';
  services.xserver = {
    enable = true;
    windowManager.awesome.enable = true;
    # disable automatic screen blanking and stuff, we'll do it manually instead
    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
    '';
  };

}
