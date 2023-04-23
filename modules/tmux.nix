{ pkgs, ... }:

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

      set-option -w -g monitor-activity off
      set-option -g visual-activity off

      set-option -g set-titles on
      set-option -g set-titles-string "#T - #W"

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

      ######################
      #### Color Schema ####
      ######################

      mainbg=colour0
      darkbg=colour236
      selected=colour237
      warn=colour1
      main=colour3
      hilight=colour11
      disable=colour240
      white=colour255

      set -g status-left 32
      set -g status-right 150
      set -g status-interval 5

      #  modes
      setw -g mode-style bg=$main,fg=$warn,bold

      # panes
      set -g pane-border-style bg=$mainbg,fg=$disable
      set -g pane-active-border-style bg=$mainbg,fg=$main

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style bg=$main,fg=$darkbg,bold
      set -g status-left ""
      set -g status-right-style bg=$main
      set -g status-right ' %H:%M '
      set -g status-right-length 50
      set -g status-left-length 20

      setw -g window-status-current-style bg=$selected,fg=$white,bold
      setw -g window-status-current-format ' #I:#W#F '

      setw -g window-status-style bg=$main,fg=$darkbg
      setw -g window-status-format ' #I:#W#F '

      setw -g window-status-bell-style bg=$warn,fg=$darkbg,bold

      # messages
      set -g message-style bg=$hilight,fg=$darkbg,bold


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
