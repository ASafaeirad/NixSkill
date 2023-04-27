{ config, pkgs, ... }:

{
  imports = [
    ./xorg.nix
    ./xinit.nix
    ./picom.nix
    ./sxhkd.nix
  ];

  home.packages = with pkgs; [
    xsel
    xdotool
    rofi
    nitrogen
    copyq
    flashfocus
    flameshot
    peek
  ];
}
