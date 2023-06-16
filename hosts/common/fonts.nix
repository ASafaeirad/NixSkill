{ config, lib, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      liberation_ttf
      fira-code
      fira-code-symbols
      courier-prime
      terminus_font
      cascadia-code
      input-fonts
      oxygenfonts
      freefont_ttf
      intel-one-mono

      # Icons
      font-awesome_5
      noto-fonts
      noto-fonts-emoji
      mplus-outline-fonts.githubRelease

      # Persian fonts
      ir-standard-fonts
      vazir-fonts
      vazir-code-font
      shabnam-fonts

      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "DejaVuSansMono"
          "Hack"
          "Meslo"
          "RobotoMono"
          "UbuntuMono"
          "SourceCodePro"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Serif" "Vazir" ];
        sansSerif = [ "DejaVu Sans" "Vazir" ];
        monospace = [ "Input Mono" "Vazir Code" ];
      };
    };
  };
}
