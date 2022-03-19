{ config, pkgs, ... }:

{
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = [
      pkgs.luaPackages.vicious
    ];
  };
}
