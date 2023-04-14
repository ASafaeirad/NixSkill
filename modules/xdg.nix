{ config, pkgs, ... }:

{
  xdg = {
    enable = false;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/notion" = "notion-app.desktop";
        "x-scheme-handler/webcal" = "brave-browser.desktop";
        "x-scheme-handler/tg" = "userapp-Telegram Desktop-V9RNW1.desktop";
        "x-scheme-handler/mailto" = "branve-browser.desktop";
        "text/plain" = "code.desktop";
        "x-scheme-handler/postman" = "Postman.desktop";
        "inode/directory" = "pcmanfm.desktop;ranger.desktop";
        "application/json" = "code.desktop";
      };
    };

    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/download";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pics";
      videos = "${config.home.homeDirectory}/videos";
    };
  };

  home.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_BIN_HOME = "$HOME/.local/bin";
  };
}
