{ config, pkgs, ... }:

{
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-git;
    luaModules = [
      pkgs.luaPackages.vicious
      pkgs.luaPackages.luarocks
      pkgs.bling
    ];
  };
}
