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


# [Settings]
# gtk-button-images=0
# gtk-cursor-theme-name=capitaine-cursors-white
# gtk-cursor-theme-size=0
# gtk-dialogs-use-header=false
# gtk-enable-event-sounds=0
# gtk-enable-input-feedback-sounds=1
# gtk-icon-theme-name=Flat-Remix-Yellow-Dark
# gtk-menu-images=0
# gtk-theme-name=Flat-Remix-GTK-Yellow-Dark
# gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
# gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
# gtk-xft-antialias=1
# gtk-xft-hinting=1
# gtk-xft-hintstyle=hintslight
# gtk-xft-rgba=none
