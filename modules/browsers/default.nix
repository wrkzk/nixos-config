{ config, pkgs, ... }:

{
  imports = [
    ./qutebrowser.nix
  ];

  home.packages = with pkgs; [
    chromium
  ];
}
