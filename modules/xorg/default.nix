{ config, pkgs, ... }:

{
  imports = [
    ./awesome.nix
    ./autorandr.nix
    ./picom.nix
    ./herbstluftwm.nix
  ];

  home.file = {
    "awesome" = {
      source = ./awesome;
      target = ".config/awesome";
    };
  };

  home.packages = with pkgs; [
    pkgs.luaPackages.vicious
    bling
    rubato
    lain
  ];
}
