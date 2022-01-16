{ config, pkgs, ... }:

{
  imports = [
    ./java.nix
    ./python.nix
  ];

  home.packages = with pkgs; [
    tilp2
    libticables2
  ];
}
