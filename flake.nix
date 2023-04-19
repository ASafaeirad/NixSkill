{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    flake-utils.url = "github:numtide/flake-utils";
    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs = inputs @ { self, nixpkgs, hyprland, home-manager, nixpkgs-wayland, flake-utils, hypr-contrib, ... }:
    let
      user = "skill";
      system = "x86_64-linux";
      locale = "en_US.UTF-8";
      timezone = "Asia/Yerevan";
      latitude = 40.179188;
      longitude = 44.499104;
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system nixpkgs;
        overlays = [
          (self: super: {
            cypress = super.cypress.overrideAttrs (old: {
              version = "12.9.0";

              src = super.fetchzip {
                url = "https://cdn.cypress.io/desktop/12.9.0/linux-x64/cypress.zip";
                sha256 = "sha256-26mkizwkF0qPX2+0rkjep28ZuNlLGPljCvVO73t34Lk=";
              };
            });
          })
        ];
        config = {
          allowUnfree = true;
          input-fonts.acceptLicense = true;
        };
      };
    in
    {
      nixosConfigurations = {
        nix-skill = (import ./hosts/nix-skill {
          inherit pkgs inputs user system lib locale timezone;
        });
      };
      homeConfigurations = {
        skill = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit hypr-contrib hyprland user latitude longitude; };
          modules = [
            # ./modules/wayland
            ./modules/xorg

            ./modules/alias.nix
            ./modules/gnome-keyring.nix
            ./modules/bookmarks.nix
            ./modules/xdg.nix
            ./modules/home.nix
            ./modules/node.nix
            ./modules/zsh.nix
            ./modules/gtk.nix
            ./modules/music.nix
            ./modules/mako.nix
            ./modules/gpg.nix
            ./modules/gammastep.nix
            ./modules/neofetch
            ./modules/obs-studio
            ./modules/zathura.nix
            ./modules/pass.nix
          ];
        };
      };
    } //

    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      rec {
        devShells = {
          default = import ./shell.nix { inherit pkgs; };
          cc = import ./shells/cc.nix { inherit pkgs; };
          go = import ./shells/go.nix { inherit pkgs; };
          dart = import ./shells/dart.nix { inherit pkgs; };
          grpc = import ./shells/grpc.nix { inherit pkgs; };
          java = import ./shells/java.nix { inherit pkgs; };
          node = import ./shells/node.nix { inherit pkgs; };
          python = import ./shells/python.nix { inherit pkgs; };
          rust = import ./shells/rust.nix { inherit pkgs; };
        };
      }
    );
}
