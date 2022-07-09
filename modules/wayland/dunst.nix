{ pkgs, config, ... }:

{
  services.dunst = {
    enable = false;
    configFile = ./dunstrc;
  };
}
