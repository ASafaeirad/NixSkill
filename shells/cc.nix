{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    gdb
    ccls
    cmake
    boost
    gnumake
    gcc-unwrapped
  ];
  shellHook = ''
  '';
}
