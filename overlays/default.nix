self: super: {
  cypress = self.callPackage ./cypress.nix { };
}
