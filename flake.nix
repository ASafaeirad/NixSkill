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
      latitude = 40.179188;
      longitude = 44.499104;
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system nixpkgs;
        config = { allowUnfree = true; };
      };
    in
    {
      nixosConfigurations = {
        nix-skill = (import ./hosts/nix-skill {
          inherit inputs user system lib;
        });
      };
      hmConfig = {
        skill = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit hypr-contrib user latitude longitude; };
          modules = [
            hyprland.homeManagerModules.default
            ./modules/xdg.nix
            ./modules/home.nix
            ./modules/wayland.nix
            ./modules/zsh.nix
            ./modules/gtk.nix
            ./modules/hyprland.nix
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
