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
    
    foot

    discord
    betterdiscordctl

    polymc
    multimc-cracked
    bintools-unwrapped
    file
    patchelf

    cbonsai
    zoom-us
    unzip
    zip
  ];
}
