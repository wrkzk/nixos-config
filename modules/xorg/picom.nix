{ config, pkgs, ... }:

{
  services.picom = {
    enable = false;
    experimentalBackends = true;
    extraOptions = ''
      shadow = true;
      shadow-radius = 7;
      shadow-offset-x = -7;
      shadow-offset-y = -7;
      shadow-exclude = [
        "name = 'Notification'",
        "class_g ?= 'Notify-osd'",
        "_GTK_FRAME_EXTENTS@:c"
      ];

      backend = "glx";
      vsync = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = false;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-client-leader = true;

      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      use-damage = true;
      log-level = "warn";

      wintypes:
      {
        tooltip = { shadow = true; focus = true; full-shadow = false; };
        dock = { shadow = false; }
        dnd = { shadow = false; }
        popup_menu = { opacity = 1; }
        dropdown_menu = { opacity = 1; }
      };
    '';
  };
}
