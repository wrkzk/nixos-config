{ config, pkgs, ... }:

{
  imports = [
    ./awesome.nix
  ];

  home.file = {
    "awesome" = {
      source = ./awesome;
      target = ".config/awesome";
    };
  };
}
