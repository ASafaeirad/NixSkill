{ config, pkgs, inputs, user, latitude, longitude, skill, ... }:

{
  programs = {
    home-manager.enable = true;
    neovim.enable = true;
    vscode.enable = true;
    fzf.enable = true;
  };

  home = {
    stateVersion = "22.11";
    username = user;
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      bat
      fd
      nixpkgs-fmt
      ripgrep
      wget
      gcc
      openssl

      # DE
      skill
      alacritty
      pavucontrol
      xdg-utils
      pcmanfm
      obsidian
      libsForQt5.qtstyleplugin-kvantum
      qt5ct
      jcal
      cliphist
      gtkcord4
      pulseaudio
      lsof
      diff-so-fancy
      htop
      mpv
      libnotify
      kooha
      imv
      networkmanagerapplet
      gh
      imagemagick
      scrot
      tesseract
      termdown

      # Apps
      brave
      chromium
      google-chrome
      firefox
      slack
      tdesktop
      discord
      notion-app-enhanced
      skypeforlinux
      anydesk
      beekeeper-studio
    ];

    sessionVariables = {
      TERM = "xterm-256color";
      SUDOEDITOR = "nvim";
      READER = "zathura";
      WIFI_ADAPTOR = "wlp0s20f3";
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "alacritty";
      LESSHISTFILE = "/dev/null";
      WGETRC = "${config.xdg.configHome}/wget/wgetrc";
      INPUTRC = "${config.xdg.configHome}/inputrc";
      KODI_DATA = "${config.xdg.dataHome}/kodi";
      ANDROID_SDK_HOME = "${config.xdg.configHome}/android";
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
