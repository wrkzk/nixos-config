{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
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
