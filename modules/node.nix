{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      nodejs
      yarn
      nodePackages.pnpm
      nodePackages."@antfu/ni"
    ];

    sessionVariables = {
      NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
      NPM_CACHE_PREFIX = "$XDG_CACHE_HOME/npm";
      PATH = "$(yarn global bin):$PATH";
    };

    shellAliases = {
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
  };
}
