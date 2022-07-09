{ config, pkgs, ... }:

{
  imports = [
  ];

  home.packages = with pkgs; [
    weechat
    irssi-override
    pidgin
  ];
}
