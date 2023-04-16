{ config, pkgs, user, ... }:

let
  locale = "en_US.UTF-8";
  timezone = "Asia/Yerevan";
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    # grub.configurationLimit = 2;
  };

  networking.hostName = "nix-skill";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  time.timeZone = timezone;

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
    groups = {
      skill = { };
    };
    defaultUserShell = pkgs.zsh;
    users = {
      skill = {
        isNormalUser = true;
        description = user;
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel" "skill" ];
        packages = with pkgs; [ ];
      };
    };
  };


  programs = {
    zsh = {
      enable = true;
      loginShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec Hyprland
        fi
      '';
    };
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
    tmux
    git
    neovim
    wget
    exa
    unzip
    ffmpeg
    ffmpegthumbnailer
    glib
    pciutils
    killall
    zip
    rar
  ];
  environment.shells = with pkgs; [ zsh ];

  security.rtkit.enable = true;
  security.sudo.extraRules = [
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

  services = {
    dbus.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
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
