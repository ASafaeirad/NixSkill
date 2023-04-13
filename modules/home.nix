{ config, pkgs, inputs, hypr-contrib, user, ... }:

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
  programs = {
    home-manager.enable = true;
    neovim.enable = true;

    zsh = {
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
    vscode.enable = true;
  };

  services = {
    gammastep = {
      enable = true;
      latitude = 40.179188;
      longitude = 44.499104;
      temperature.night = 4500;
    };
    network-manager-applet.enable = true;
  };

  xdg = {
    enable = false;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/notion" = "notion-app.desktop";
        "x-scheme-handler/webcal" = "brave-browser.desktop";
        "x-scheme-handler/tg" = "userapp-Telegram Desktop-V9RNW1.desktop";
        "x-scheme-handler/mailto" = "branve-browser.desktop";
        "text/plain" = "code.desktop";
        "x-scheme-handler/postman" = "Postman.desktop";
        "inode/directory" = "pcmanfm.desktop;ranger.desktop";
        "application/json" = "code.desktop";
      };
    };

    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/download";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pics";
      videos = "${config.home.homeDirectory}/videos";
    };
  };

  home = {
    stateVersion = "22.11";
    username = user;
    homeDirectory = "/home/${user}";
    shellAliases = { };
    packages = with pkgs; [
      nixpkgs-fmt
      wget
      gnumake
      pass-wayland
      pass-git-helper

      # DE
      alacritty
      pavucontrol
      rofi-wayland
      wofi
      xdg-utils
      pcmanfm
      obsidian
      libsForQt5.qtstyleplugin-kvantum
      qt5ct
      jcal
      cliphist
      wl-clipboard
      # gtkcord4
      pulseaudio
      lsof
      diff-so-fancy
      htop
      hypr-contrib.packages.${system}.grimblast
      mpv
      libnotify
      kooha
      imv

      # Apps
      brave
      slack
      tdesktop
      discord
      notion-app-enhanced
    ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      # WLR_NO_HARDWARE_CURSORS = "1"; # if no cursor,uncomment this line
      TERM = "xterm-256color";
      SUDOEDITOR = "nvim";
      READER = "zathura";
      WIFI_ADAPTOR = "wlp0s20f3";
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "alacritty";
      ZDOTDIR = "${config.xdg.configHome}/zsh";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      LESSHISTFILE = "/dev/null";
      WGETRC = "${config.xdg.configHome}/wget/wgetrc";
      INPUTRC = "${config.xdg.configHome}/inputrc";
      KODI_DATA = "${config.xdg.dataHome}/kodi";
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      ANDROID_SDK_HOME = "${config.xdg.configHome}/android";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      GOPATH = "${config.xdg.dataHome}/go";
      ANSIBLE_CONFIG = "${config.xdg.configHome}/ansible/ansible.cfg";
      UNISON = "${config.xdg.dataHome}/unison";
      HISTFILE = "${config.xdg.dataHome}/history";
      WAKATIME_HOME = "${config.xdg.configHome}/wakatime";
      ACKRC = "${config.xdg.configHome}/ack/ackrc";
      NODE_REPL_HISTORY = "${config.xdg.cacheHome}/node_repl_history";
      NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
      npm_config_devdir = "${config.xdg.cacheHome}";
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
      WINEPREFIX = "${config.xdg.dataHome}/wineprefixes/default";
      GRADLE_USER_HOME = "${config.xdg.dataHome}";
      VSCODE_PORTABLE = "${config.xdg.dataHome}";
      SDKMAN_DIR = "${config.xdg.dataHome}/sdkman";
      AWS_SHARED_CREDENTIALS_FILE = "${config.xdg.configHome}";
      AWS_CONFIG_FILE = "${config.xdg.configHome}";
      LEIN_HOME = "${config.xdg.dataHome}";
      NETRC = "${config.xdg.dataHome}/netrc";
      CURLOPT_NETRC_FILE = "${config.xdg.dataHome}/netrc";
      FZF_DEFAULT_OPTS = "--layout=reverse --height 40%";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.local/bin/menus"
    ];
  };
}
