{ config, pkgs, ... }:

{
  xresources = {
    path = "${config.xdg.configHome}/X11/Xresources";
    properties = {
      "Xft.dpi" = 96;
      "Xft.antialias" = true;
      "Xft.hinting" = true;
      "Xft.rgba" = "rgb";
      "Xft.autohint" = false;
      "Xft.hintstyle" = "hintslight";
      "Xft.lcdfilter" = "lcddefault";

      "*cursorBlink" = false;
      "*scrollBar" = false;

      "*background" = "#23252E";
      "*foreground" = "#eeeeee";
      "*fading" = 8;
      "*fadeColor" = "#333333";
      "*cursorColor" = "#CE20C4";
      "*pointerColorBackground" = "#313744";
      "*pointerColorForeground" = "#16A085";

      # black dark/light
      "*color0" = "#556570";
      "*color8" = "#556570";

      # red dark/light
      "*color1" = "#E17E85";
      "*color9" = "#E17E85";

      # green dark/light
      "*color2" = "#61BA86";
      "*color10" = "#61BA86";

      # yellow dark/light
      "*color3" = "#F6CA52";
      "*color11" = "#FFEC8E";

      # blue dark/light
      "*color4" = "#4CB2FF";
      "*color12" = "#4CB2FF";

      # magenta dark/light
      "*color5" = "#BE86E3";
      "*color13" = "#BE86E3";

      # cyan dark/light
      "*color6" = "#2DCED0";
      "*color14" = "#2DCED0";

      # white dark/light
      "*color7" = "#999999";
      "*color15" = "#999999";

      "Xcursor.theme" = "capitaine-cursors-light";
      "Xcursor.size" = "16";

      "URxvt.perl-ext-common" = "default,resize-font";
      "URxvt.resize.font.smaller" = "C-=";
      "URxvt.resize.font.bigger" = "C--";
      "URxvt.font" = "xft:Input Mono:size=9";

      "!*font" = "xft:Courier Prime:size=15:antialias=true";
      "!*boldFont" = "xft:Courier Prime:bold:size=15:antialias=true";
      "!*letterSpace" = 1;
    };
  };
}
