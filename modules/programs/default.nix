{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
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

    wayfire
    wayfireApplications-unwrapped.wcm
  ];
}
