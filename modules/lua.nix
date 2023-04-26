{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lua
      sumneko-lua-language-server
    ];
  };
}
