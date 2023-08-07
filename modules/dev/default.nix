{ config, pkgs, ... }:

{
  imports = [
    ./lua.nix
    ./node.nix
    ./rust.nix
    ./python.nix
  ];
  home = {
    packages = with pkgs; [
      gcc
      act
    ];
  };
}
