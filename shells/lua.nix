{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    lua
  ];
  shellHook = ''
  '';
}
