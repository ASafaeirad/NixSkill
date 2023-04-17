{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    nodejs
    yarn
    nodePackages.pnpm
    nodePackages."@antfu/ni"
  ];
  shellHook = ''
    export PATH="$(yarn global bin):$PATH"
    alias npms="nr start"
    zsh
  '';
}
