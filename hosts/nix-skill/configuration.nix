{ config, pkgs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    # grub.configurationLimit = 2;
  };

  networking.hostName = "nix-skill";
}
