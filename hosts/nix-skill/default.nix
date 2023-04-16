{ lib, system, inputs, user, locale, timezone, ... }:

lib.nixosSystem rec {
  inherit system;
  specialArgs = {
    inherit user locale timezone;
  };

  modules = [
    inputs.hyprland.nixosModules.default
    ../common/configuration.nix
    ./configuration.nix
  ];
}
