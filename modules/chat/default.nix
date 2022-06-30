{ config, pkgs, ... }:

{
  imports = [
  ];

  home.package = with pkgs; [
    weechat
  ];
}
