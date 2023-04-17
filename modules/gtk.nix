{ config, pkgs, lib, inputs, user, ... }:

{
  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors-white";
    size = 16;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Flat-Remix-GTK-Yellow-Dark";
      package = pkgs.flat-remix-gtk;
    };

    cursorTheme = {
      name = "Catppuccin-Frappe-Light";
    };

    iconTheme = {
      name = "Flat-Remix-Yellow-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };
}
