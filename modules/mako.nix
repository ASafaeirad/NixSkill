{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    font = "DejaVu Sans 9";
    width = 256;
    height = 500;
    margin = "0,0,5,0";
    padding = "8,16";
    borderSize = 0;
    borderRadius = 4;
    defaultTimeout = 10;
    anchor = "top-right";
    backgroundColor = "#272935";
    borderColor = "#c0caf5";
    progressColor = "over #FED86E";
    textColor = "#FAF4FC";
    format = "%a\\n<b>%s</b>\\n%b";
    extraConfig = ''
      outer-margin=10
      on-notify=exec mpv $HOME/.config/nix/assets/notification.ogg

      [urgency=high]
      border-color=#B45C65
    '';
  };
}
