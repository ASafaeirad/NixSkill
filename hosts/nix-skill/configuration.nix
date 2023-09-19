{ config, pkgs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.swraid.enable = false;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  networking.hostName = "nix-skill";
  services.blueman.enable = true;
}
