{ config, pkgs, latitude, longitude, ... }:

{
  services = {
    gammastep = {
      enable = true;
      inherit latitude longitude;
      temperature.night = 4500;
    };
    network-manager-applet.enable = true;
  };
}
