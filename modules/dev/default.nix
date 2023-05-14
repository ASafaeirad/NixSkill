{ config, hyprland, pkgs, ... }:

{
  imports = [
    ./lua.nix
    ./node.nix
    ./rust.nix
    ./python.nix
  ];
}
