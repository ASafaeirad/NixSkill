{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  buildInputs = [
    python311Packages.pip
    python311Packages.pip-tools
    python311Packages.python-lsp-black
    python311Packages.python-lsp-server
    python311Packages.python-lsp-jsonrpc
    python311
  ];
  shellHook = ''
    export PYTHONPYCACHEPREFIX = "$XDG_CACHE_HOME/python"
    export PYTHONUSERBASE = "$XDG_DATA_HOME/python"
  '';
}
