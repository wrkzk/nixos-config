{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    configDir = ./eww-config-dir;
  };
}
