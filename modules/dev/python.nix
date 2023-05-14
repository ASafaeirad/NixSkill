{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      python311Packages.pip
      python311Packages.pip-tools
      python311Packages.python-lsp-black
      python311Packages.python-lsp-server
      python311Packages.python-lsp-jsonrpc
      python311
    ];

    sessionVariables = {
      PYTHONPYCACHEPREFIX = "$XDG_CACHE_HOME/python";
      PYTHONUSERBASE = "$XDG_DATA_HOME/python";
    };
  };
}
