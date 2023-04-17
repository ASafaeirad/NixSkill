{ config, pkgs, user, locale, timezone, ... }:

{
  programs.zsh.loginShellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
       exec startx "$HOME/.config/X11/xinitrc"
    fi
  '';

  environment.systemPackages = with pkgs; [
    awesome
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    layout = "us,ir";
    xkbOptions = "grp:shifts_toggle,caps:escape";
    displayManager.startx.enable = true;
    libinput.enable = true;
    # disable automatic screen blanking and stuff, we'll do it manually instead
    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
    '';
  };

}
