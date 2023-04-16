{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    extraConfig = ''
      super + Return
        alacritty

      super + F{2,3,4,5}
        {brave,code,pcmanfm,terminal -e mus}

      super + ctrl + alt + shift + {2,3,4,5}
        {brave,code,pcmanfm,terminal -e mus}

      super + v
        copyq show

      super + ctrl + {x,m,c,v,o}
        {xkill, pavucontrol, colorpicker --short --one-shot | xsel -b, neovide, ocr}

      super + shift + {space, s, e, d, p, z, c, g, b}
        {rofi -show drun, powermenu, egmenu, smenu, pmenu --type, emoji-menu, camp-menu, github-menu, changelog-menu}


      super + ctrl + alt + shift + {space, s, e, d, p, z, c, g, b}
        {rofi -show drun, powermenu, egmenu, smenu, pmenu --type, emoji-menu, camp-menu, github-menu, changelog-menu}

      super + {_, control} + p
        {flameshot full -c -p $(xdg-user-dir PICTURES)/screenshots/, flameshot gui}

      super + shift + t
        alacritty --class flyterm -e tmux new-session -A -s flyterm

      XF86Audio{LowerVolume,RaiseVolume,Mute}
        amixer set Master {10%-, 10%+, toggle}

      XF86MonBrightness{Down,Up}
        light {-U,-A} 5

      # super + ctrl + {_, shift} + p
      #   {/home/skill/.local/bin/automation/register, pkill register}

    '';
  };
  home.packages = with pkgs; [
    xsel
    rofi
  ];
}
