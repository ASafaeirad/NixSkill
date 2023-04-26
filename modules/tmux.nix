{ pkgs, ... }:

let
  theme = builtins.fetchGit {
    url = "https://github.com/ASafaeirad/skill-tmux-theme.git";
  };

  customPlugins = pkgs.stdenv.mkDerivation {
    name = "tmux-custom-plugins";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/tmux-skill-theme
      cp -r ${theme}/* $out/tmux-skill-theme/
    '';
  };
in
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    extraConfig = ''
      set -g renumber-windows on
      set -g display-time 4000

      set -g focus-events on
      set -w -g monitor-activity off
      set -g visual-activity off

      set -g set-titles on
      set -g set-titles-string "#T - #W"
      set -g status-interval 5

      bind R source-file $XDG_CONFIG_HOME/tmux/tmux.conf

      bind - split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"

      unbind [
      bind Escape copy-mode
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "scopy"
      unbind p
      bind p paste-buffer

      bind -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "tmux save-buffer - | scopy"
      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode when dragging with mouse

      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      run-shell "${customPlugins}/tmux-skill-theme/skill.tmux"
    '';
    historyLimit = 10000;
    mouse = true;
    newSession = false;
    terminal = "screen-256color";
    prefix = "C-a";
    plugins = with pkgs; [
    ];
  };
}
