{ config, pkgs, ... }:

{
 # xsession.windowManager.herbstluftwm = {
 #   enable = true;
 # };
  home.packages = with pkgs; [
    herbstluftwm
  ];
}
