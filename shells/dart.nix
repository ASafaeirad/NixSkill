{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    dart
    flutter
  ];
  shellHook = ''
    FLUTTER_SDK_DIR=${flutter}/bin/cache/dart-sdk/
  '';
}
