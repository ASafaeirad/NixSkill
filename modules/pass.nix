{ config, pkgs, ... }:

{
  programs.browserpass = {
    enable = true;
  };

  home = {
    packages = with pkgs; [
      pass-git-helper
      pass-wayland
    ];

    sessionVariables = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };
}
