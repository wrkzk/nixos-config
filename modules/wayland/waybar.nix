{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        mode = "dock";
        position = "top";
        height = 25;
        modules-left = [ "custom/workspaces" ];
        modules-right = [ "battery" "clock" ];

        "clock" = {
          format = "{:%a %d %b %H:%M}";
          tooltip = false;
        };

        "battery" = {
          design-capacity = true;
          interval = 60;
          format = "{capacity}%";
          tooltip = false;
        };

        "custom/workspaces" = {
          exec = "~/bin/workspaces.sh";
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: CaskaydiaCove Nerd Font;
        font-size: 12.5px;
      }

      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
    '';
  };
}
