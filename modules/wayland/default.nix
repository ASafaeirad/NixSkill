{ config, hyprland, pkgs, ... }:

{
  imports = [
    hyprland.homeManagerModules.default
    ./hyprland.nix
    ./wayland.nix
  ];
}
