{ config, pkgs, ... }:

{
  imports = [
    ./awesome.nix
    ./autorandr.nix
    ./picom.nix
  ];

  home.file = {
    "awesome" = {
      source = ./awesome;
      target = ".config/awesome";
    };
  };

  home.packages = with pkgs; [
    pkgs.luaPackages.vicious
  ];
}
