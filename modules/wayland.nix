{  pkgs, ... }:

{
  home.packages = with pkgs; [
    wtype
    rofi-wayland
    wofi
    wl-clipboard
  ];
}
