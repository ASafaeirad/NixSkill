{ config, pkgs, ... }:

{
  imports = [
    ./lua.nix
    ./node.nix
    ./rust.nix
    ./java.nix
    ./python.nix
  ];
  home = {
    packages = with pkgs; [
      gcc
      act
    ];
  };
}
