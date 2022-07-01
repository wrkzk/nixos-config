{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;
    configFile = ./dunstrc
  };
}
