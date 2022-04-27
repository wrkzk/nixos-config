{ pkgs }:

{
  programs.waybar.enable = {
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 25;
        modules-right = [ "clock" ]

        "clock" = {
          format = "%a %d %b %H:%M";
          tooltip = false;
        };
      };
    }
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
      }

      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
    '';
  };
}
