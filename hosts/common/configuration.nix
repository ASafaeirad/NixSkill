{ config, pkgs, user, locale, timezone, ... }:

{
  imports = [
    ./docker.nix
    ./fonts.nix
  ];

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  time.timeZone = timezone;
  # If you don't use MS Windows comment this line
  time.hardwareClockInLocalTime = true;

  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };

  users = {
    groups."${user}" = { };
    defaultUserShell = pkgs.zsh;
    users = {
      "${user}" = {
        isNormalUser = true;
        description = user;
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel" "video" "audio" user ];
      };
    };
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    light.enable = true;
    # mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.input-fonts.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    acpi
    bc
    exa
    ffmpeg
    ffmpegthumbnailer
    git
    glib
    gnumake
    inxi
    killall
    neovim
    pciutils
    rar
    tmux
    unzip
    wget
    zip
  ];
  environment.shells = with pkgs; [ zsh ];
  security = {
    # pam.services.gnome-keyring.enableGnomeKeyring = true;
    rtkit.enable = true;
    sudo.extraRules = [
      {
        users = [ user ];
        commands = [
          {
            command = "ALL";
            options = [ "SETENV" "NOPASSWD" ];
          }
        ];
      }
    ];
  };

  services = {
    dbus.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      allowed-users = [ "root" user ];
    };
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 30d";
    # };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
