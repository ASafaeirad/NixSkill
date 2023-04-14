{ lib, system, inputs, user, ... }:

lib.nixosSystem rec {
  inherit system;
  specialArgs = {
    inherit user;
  };

  modules = [
    inputs.hyprland.nixosModules.default
    ./configuration.nix
    ../common/docker.nix
    ../common/fonts.nix
  ];
}
