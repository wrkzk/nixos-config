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
    signal-desktop
    scrcpy

    polymc
    multimc-cracked
    bintools-unwrapped
    file
    patchelf

    cbonsai
    zoom-us
    unzip
    zip

    mathematica-latest
    #virt-manager

    sysfsutils
    grub2
    xorriso

    bling
    rubato
    lain

    blender
    steam
  ];
}
