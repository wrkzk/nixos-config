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
      font = {
        size = 10.5;
        normal = {
	  family = "Iosevka Nerd Font";
	  style = "Regular";
	};
      };
      colors = {
        primary = {
      	  background = "#282828";
          foreground = "#d4be98";
	};
        normal = {
          black = "#3c3836";
          red = "#ea6962";
          green = "#a9b665";
          yellow = "#d8a657";
          blue = "#7daea3";
          magenta = "#d3869b";
          cyan = "#89b482";
          white = "#d4be98";
	};
        bright = {
          black = "#3c3836";
          red = "#ea6962";
          green = "#a9b665";
          yellow = "#d8a657";
          blue = "#7daea3";
          magenta = "#d3869b";
          cyan = "#89b482";
          white = "#d4be98";
	};
      };
    };
  };
}
