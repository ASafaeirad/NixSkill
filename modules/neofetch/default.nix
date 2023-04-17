{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.neofetch ];
  xdg.configFile."/neofetch/config.conf".text = import ./config.nix;
}
