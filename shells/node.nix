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
    export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
    export NPM_CACHE_PREFIX="$XDG_CACHE_HOME/npm"
    export PATH="$(yarn global bin):$PATH"
    alias npms="nr start"
    zsh
  '';
}
