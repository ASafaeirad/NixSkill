{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.cargo
      pkgs.rustc
    ];
  };
}
