{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    python310Packages.pip
    python310Packages.pip-tools
    python310Packages.python-lsp-black
    python310Packages.python-lsp-server
    python310Packages.python-lsp-jsonrpc
  ];
  shellHook = ''
    export PYTHONPYCACHEPREFIX = "$XDG_CACHE_HOME/python"
    export PYTHONUSERBASE = "$XDG_DATA_HOME/python"
  '';
}
