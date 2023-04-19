{ config, pkgs, ... }:

let
  zsh-skill-theme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/ASafaeirad/oh-my-zsh-skill-theme/main/skill.zsh-theme";
    sha256 = "1x2l0mws3bm9gv7yrd5vvf3rs0gbynfxd39zffs99n1lbzc8w7b8";
  };
  forgit = builtins.fetchGit {
    url = "https://github.com/wfxr/forgit.git";
  };
  zsh-completions = builtins.fetchGit {
    url = "https://github.com/zsh-users/zsh-completions";
  };
  customDir = pkgs.stdenv.mkDerivation {
    name = "oh-my-zsh-custom-dir";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      mkdir -p $out/plugins
      cp ${zsh-skill-theme} $out/themes/skill.zsh-theme
      cp -r ${forgit} $out/plugins/forgit
      cp -r ${zsh-completions} $out/plugins/zsh-completions
    '';
  };
in
{
  home.packages = with pkgs; [
    zsh-forgit
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autocd = true;
    enableAutosuggestions = true;
    historySubstringSearch.enable = true;
    history = {
      expireDuplicatesFirst = true;
      ignorePatterns = [ ];
      path = "$ZDOTDIR/.zsh_history";
      save = 100000;
      size = 100000;
    };
    oh-my-zsh = {
      enable = true;
      theme = "skill";
      custom = "${customDir}";
      extraConfig = ''
        fpath+=${customDir}/plugins/zsh-completions/src
      '';
      plugins = [
        "sudo"
        "emoji"
        "colored-man-pages"
        "zsh-completions"
        "forgit"
        "vi-mode"
      ];
    };
  };

  home.sessionVariables = {
    ZDOTDIR = "${config.xdg.configHome}/zsh";
  };
}
