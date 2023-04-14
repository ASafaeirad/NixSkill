{ config, pkgs, ... }:

let
  zsh-skill-theme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/ASafaeirad/oh-my-zsh-skill-theme/main/skill.zsh-theme";
    sha256 = "1x2l0mws3bm9gv7yrd5vvf3rs0gbynfxd39zffs99n1lbzc8w7b8";
  };
  customDir = pkgs.stdenv.mkDerivation {
    name = "oh-my-zsh-custom-dir";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${zsh-skill-theme} $out/themes/skill.zsh-theme
    '';
  };
in
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autocd = true;
    history = {
      path = "$ZDOTDIR/.zsh_history";
      save = 100000;
      size = 100000;
    };
    oh-my-zsh = {
      enable = true;
      theme = "skill";
      custom = "${customDir}";
    };
    historySubstringSearch = {
      enable = true;
    };
  };

  home.sessionVariables = {
    ZDOTDIR = "${config.xdg.configHome}/zsh";
  };
}
