{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      mpc-cli
    ];
  };
  programs.ncmpcpp = {
    enable = true;
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "J"; command = "move_sort_order_down"; }
      { key = "ctrl-d"; command = "page_down"; }

      { key = "k"; command = "scroll_up"; }
      { key = "K"; command = "move_sort_order_up"; }
      { key = "ctrl-u"; command = "page_up"; }

      { key = "l"; command = "next_column"; }
      { key = "h"; command = "previous_column"; }
      { key = "g"; command = "move_home"; }
      { key = "G"; command = "move_end"; }
      { key = "0"; command = "replay_song"; }
      { key = "t"; command = [ "find" "find_item_forward" ]; }

      { key = "+"; command = "show_clock"; }
      { key = "="; command = "volume_up"; }

      { key = "c"; command = "show_lyrics"; }
      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
    ];
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = config.xdg.userDirs.music;
      extraConfig = ''
        audio_output {
                type            "pipewire"
                name            "PipeWire Sound Server"
        }
      '';
    };
  };
}
