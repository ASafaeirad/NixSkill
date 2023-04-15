{  pkgs, ... }:

{
  home.packages = with pkgs; [
    pass-wayland
    wtype
    rofi-wayland
    wofi
    wl-clipboard
  ];
}
