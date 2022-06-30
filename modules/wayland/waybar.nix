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
        font-family: CaskaydiaCove Nerd Font;
        font-size: 12.5px;
      }

      window#waybar {
        background: #15161e;
        color: #c0caf5;
      }

      #clock {
        background-color: #272939;
        margin-right: 3px;
        margin-top: 3px;
        margin-bottom: 3px;
        border-radius: 4px;
      }

      #battery {
        background-color: #272939;
        margin-right: 10px;
        margin-top: 3px;
        margin-bottom: 3px;
        border-radius: 4px;
      }

      #custom-workspaces {
        background-color: #272939;
        margin-left: 3px;
        margin-top: 3px;
        margin-right: 3px;
        margin-bottom: 3px;
        border-radius: 4px;
      }
    '';
  };
}
