{ config, pkgs, ... }:

{
  imports = [
    ./java.nix
    ./python.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    arduino
    gcc
  ];
}
