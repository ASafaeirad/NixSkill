self: super: {
  cypress = self.callPackage ./cypress.nix { };
  appflowy = self.callPackage ./cypress.nix { };
  skill-bin = self.callPackage ./bin.nix { };
  bun-next = self.callPackage ./bun.nix { };
}
