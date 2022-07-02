{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lutris
    gnome3.adwaita-icon-theme
  ];
}
