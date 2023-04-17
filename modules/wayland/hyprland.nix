{ config, lib, pkgs, hypr-contrib, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hypr-contrib.packages.${system}.grimblast
  ];

  programs = {
    waybar = {
      enable = true;
      systemd.enable = true;
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    # WLR_NO_HARDWARE_CURSORS = "1"; # if no cursor,uncomment this line
    QT_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    WLR_DRM_DEVICES = "/dev/dri/card0";
    GDK_BACKEND = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    QT_STYLE_OVERRIDE = "kvantum";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor=, highres, 0x0, 1

      source = ~/.config/hypr/startup.conf
      source = ~/.config/hypr/general.conf
      source = ~/.config/hypr/animation.conf
      source = ~/.config/hypr/keybinds.conf
      source = ~/.config/hypr/windowrules.conf
    '';
  };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

}
