{
  description = "Skill Binaries";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.skill-bin = with import nixpkgs { system = "x86_64-linux"; }; stdenv.mkDerivation {
      name = "skill-binaries";
      version = "0.0.1";
      src = ./.;
      dontPatchShebangs = true;
      installPhase = ''
        echo "INSTLLING"
        echo $out
        mkdir -p $out/bin
        cp * $out/bin
      '';

    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.skill-bin;
  };
}
