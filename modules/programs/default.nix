{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    neofetch
    pfetch
    discord
    cbonsai
    zoom-us
    unzip
    zip
  ];
}
