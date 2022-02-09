{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./git.nix
  ];

  overlays = [
    ./multimc.nix
  ];
  
  home.packages = with pkgs; [
    neofetch
    pfetch
    discord
    cbonsai
    zoom-us
    unzip
    zip
    multimc
  ];
}
