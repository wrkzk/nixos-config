{ config, pkgs, ... }:

{
  imports = [
    ./awesome.nix
    ./autorandr.nix
  ];

  home.file = {
    "awesome" = {
      source = ./awesome;
      target = ".config/awesome";
    };
  };
}
