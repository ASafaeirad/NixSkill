{ lib, system, pkgs, inputs, user, locale, timezone, ... }:

lib.nixosSystem rec {
  inherit system pkgs;
  specialArgs = {
    inherit user locale timezone;
  };

  modules = [
    ../common/awesome.nix
    ../common/configuration.nix
    ./configuration.nix
  ];
}
