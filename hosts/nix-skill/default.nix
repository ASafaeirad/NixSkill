{ lib, system, inputs, user, ... }:

lib.nixosSystem rec {
  inherit system;
  specialArgs = {
    inherit user;
  };

  modules = [
    inputs.hyprland.nixosModules.default
    ../common/configuration.nix
    ./configuration.nix
  ];
}
