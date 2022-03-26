{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "fish";
      };
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
      };
      ipc_socket = true;
      window = {
        padding = {
          x = 3;
          y = 3;
        };
      };
      font = {
        size = 9.5;
        normal = {
	  family = "CaskaydiaCove Nerd Font";
	  style = "Regular";
	};
      };
      colors = {
        primary = {
          background = "#1a1b26";
          foreground = "#c0caf5";
        };
        normal = {
          black = "#15161e";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#ff9e64";
          }
          { index = 17;
            color = "#db4b4b";
          }
        ];
      };
    };
  };
}
