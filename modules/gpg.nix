{ config, pkgs, ... }:
{
  programs.gpg = {
    package = pkgs.gnupg;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "curses";
      defaultCacheTtlSsh = 14400;
      defaultCacheTtl = 7200;
      maxCacheTtl = 7200;
      maxCacheTtlSsh = 14400;
      extraConfig = ''
        debug-pinentry
      '';
    };
  };

  home.sessionVariables = {
    GNUPGHOME = "${config.xdg.dataHome}/gnupg";
  };
}
