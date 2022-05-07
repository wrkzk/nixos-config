{ config, pkgs, ...}:

{
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    sway
  ];
}
