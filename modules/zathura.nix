{ lib, pkgs, user, ... }:

{
  programs.zathura = {
    enable = true;
    mappings = {
      "f" = "toggle_fullscreen";
      "[fullscreen] f" = "toggle_fullscreen";
      "<C-i>" = "recolor";
    };
    options = {
      adjust-open = "best-fit";
      pages-per-row = 1;
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      selection-clipboard = "clipboard";
      font = "DejaVu Sans 12";
      default-bg = "#23252e";
      default-fg = "#F7F7F6";
      statusbar-fg = "#B0B0B0";
      statusbar-bg = "#202020";
      inputbar-bg = "#151515";
      inputbar-fg = "#FFFFFF";
      notification-error-bg = "#AC4142";
      notification-error-fg = "#151515";
      notification-warning-bg = "#AC4142";
      notification-warning-fg = "#151515";
      highlight-color = "#ffd667";
      highlight-active-color = "#6A9FB5";
      completion-highlight-fg = "#151515";
      completion-highlight-bg = "#ffd667";
      completion-bg = "#303030";
      completion-fg = "#E0E0E0";
      notification-bg = "#ffd667";
      notification-fg = "#151515";
      recolor = "true";
      recolor-lightcolor = "#23252e";
      recolor-darkcolor = "#E0E0E0";
      recolor-reverse-video = "true";
      recolor-keephue = "true";
      render-loading = "false";
      scroll-step = 50;
    };
  };
}
