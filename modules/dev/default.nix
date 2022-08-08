{ config, pkgs, ... }:

{
  imports = [
    ./java.nix
    ./python.nix
    ./git.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    arduino
    gcc

  ];
}
