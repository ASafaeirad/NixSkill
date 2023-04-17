{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    fade = false;
    inactiveOpacity = 1.0;
    activeOpacity = 1.0;

    settings = {
      dbus = false;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      use-ewmh-active-win = false;
      detect-transient = true;
      glx-no-stencil = true;
      use-damage = true;
      log-level = "warn";
      show-all-xerrors = false;
      corner-radius = 8;
      frame-opacity = 1.0;
      inactive-opacity-override = true;
      inactive-dim = 0.0;
    };
  };
}
