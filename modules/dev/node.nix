{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nodejs
      yarn
      nodePackages.pnpm
      cypress
    ];

    sessionVariables = {
      PATH = "$(yarn global bin):$PATH";
      CYPRESS_RUN_BINARY="$(which Cypress)";
      CYPRESS_INSTALL_BINARY="0";
    };

    shellAliases = {
      npmrc = "$EDITOR $XDG_CONFIG_HOME/npm/npmrc";
      npmls = "npm ls --depth 0";
      npmi = "ni";
      npmg = "npm install --location=global";
      npms = "nr start";
      npmb = "nr build";
      npmt = "nr test";
      npmd = "ni -D";
      ncu = "npm-check -u";
      cleannm = "find . -name 'node_modules' -type d -exec rm -rf {} \;";
      renpm = "rm -rf node_modules && rm ./package-lock.json && npm i";
    };

    sessionPath = [
      "$XDG_DATA_HOME/npm/bin"
    ];
  };
}
