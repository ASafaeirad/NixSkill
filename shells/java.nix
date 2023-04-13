{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    jre8
    jdk8
  ];
  shellHook = ''
  '';
}
