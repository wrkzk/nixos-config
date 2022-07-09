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
        size = 10.5;
        normal = {
          #family = "CaskaydiaCove Nerd Font";
          family = "Tamzen";
	  style = "Regular";
	};
      };
      #colors = {
      #  primary = {
      #    background = "#1a1b26";
      #    foreground = "#c0caf5";
      #  };
      #  normal = {
      #    black = "#15161e";
      #    red = "#f7768e";
      #    green = "#9ece6a";
      #    yellow = "#e0af68";
      #    blue = "#7aa2f7";
      #    magenta = "#bb9af7";
      #    cyan = "#7dcfff";
      #    white = "#a9b1d6";
      #  };
      #  bright = {
      #    black = "#414868";
      #    red = "#f7768e";
      #    green = "#9ece6a";
      #    yellow = "#e0af68";
      #    blue = "#7aa2f7";
      #    magenta = "#bb9af7";
      #    cyan = "#7dcfff";
      #    white = "#c0caf5";
      #  };
      #  indexed_colors = [
      #    {
      #      index = 16;
      #      color = "#ff9e64";
      #    }
      #    { index = 17;
      #      color = "#db4b4b";
      #    }
      #  ];
      #};
      #colors = {
      #  primary = {
      #    background = "#2b3339";
      #    foreground = "#d3c6aa";
      #  };
      #  normal = {
      #    black = "#4b565c";
      #    red = "#e67e80";
      #    green = "#a7c080";
      #    yellow = "#dbbc7f";
      #    blue = "#7fbbb3";
      #    magenta = "#d699b6";
      #    cyan = "#83c092";
      #    white = "#d3c6aa";
      #  };
      #  bright = {
      #    black = "#4b565c";
      #    red = "#e67e80";
      #    green = "#a7c080";
      #    yellow = "#dbbc7f";
      #    blue = "#7fbbb3";
      #    magenta = "#d699b6";
      #    cyan = "#83c092";
      #    white = "#d3c6aa";
      #  };
      #};
      colors = {
        primary = {
          background = "#171717";
          foreground = "#fce8c3";
        };
        cursor = {
          text = "CellBackground";
          cursor = "#fbb829";
        };
        normal = {
          black = "#1c1b19";
          red = "#ef2f27";
          green = "#519f50";
          yellow = "#fbb829";
          blue = "#2c78bf";
          magenta = "#e02c6d";
          cyan = "#0aaeb3";
          white = "#baa67f";
        };
        bright = {
          black = "#918175";
          red = "#f75341";
          green = "#98bc37";
          yellow = "#fed06e";
          blue = "#68a8e4";
          magenta = "#ff5c8f";
          cyan = "#2be4d0";
          white = "#fce8c3";
        };
      };
      #colors = {
      #  primary = {
      #    background = "#2f383e";
      #    foreground = "#d3c6aa";
      #  };
      #  normal = {
      #    black = "#4b565c";
      #    red = "#e67e80";
      #    green = "#a7c080";
      #    yellow = "#dbbc7f";
      #    blue = "#7fbbb3";
      #    magenta = "#d699b6";
      #    cyan = "#83c092";
      #    white = "#d3c6aa";
      #  };
      #  bright = {
      #    black = "#4b565c";
      #    red = "#e67e80";
      #    green = "#a7c080";
      #    yellow = "#dbbc7f";
      #    blue = "#7fbbb3";
      #    magenta = "#d699b6";
      #    cyan = "#83c092";
      #    white = "#d3c6aa";
      #  };
      #};
    };
  };
}
