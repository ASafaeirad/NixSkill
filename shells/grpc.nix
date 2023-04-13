{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    grpc
    grpcui
    grpcurl
    grpc-tools
  ];
  shellHook = ''
  '';
}
