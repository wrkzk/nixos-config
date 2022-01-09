{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
      }
      font = {
        size = 10;
        normal = {
	  family = "Iosevka Nerd Font";
	  style = "Regular";
	};
      };
    };
  };
}
