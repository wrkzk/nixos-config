{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./ncmpcpp.nix
    ./fish.nix
  ];

  home.packages = with pkgs; [
    neofetch
    pfetch
    
    gnumake
    nasm

    discord
    betterdiscordctl

    cbonsai
    zoom-us
    unzip
    zip
    aria
    ncmpcpp
    mathematica-latest
    virt-manager

    vlc

    sysfsutils
    
    blender
    steam

    libnotify
    soco-cli
    inkscape

    minetest
    polymc
    multimc

    wezterm

    wirelesstools

    spotdl
    
    wayfire
    wayfireApplications-unwrapped.wcm
  ];
}
