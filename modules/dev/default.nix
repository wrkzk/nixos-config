{ config, pkgs, ... }:

{
  imports = [
    ./java.nix
  ];

  home.packages = with pkgs; [
    tilp2
    libticables2
    python
  ];
}
