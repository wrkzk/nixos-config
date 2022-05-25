{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      font = "CaskaydiaCove Nerd Font:size=9.5";
      dpi-aware = "no";
    }
  };
}
