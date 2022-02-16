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
    betterdiscordctl

    cbonsai
    zoom-us
    unzip
    zip
  ];
}
