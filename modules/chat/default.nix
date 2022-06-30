{ config, pkgs, ... }:

{
  imports = [
    ./weechat.nix
  ];

  home.package = with pkgs; [
    weechat
  ];
}
