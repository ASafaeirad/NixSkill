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
    rofi
    nitrogen
    copyq
    flashfocus
  ];
}
