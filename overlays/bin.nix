self: super: {
  skill-bin = super.stdenv.mkDerivation {
    name = "skill-bin";
    src = ../bin;
    dontPatchShebangs = true;
    installPhase = ''
      mkdir -p $out/bin
      mv * $out/bin
    '';
  };
}
