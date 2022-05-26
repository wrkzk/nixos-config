{ config, pkgs, ...}:

{
  imports = [
    ./waybar.nix
    ./foot.nix
    ./eww.nix
  ];

  home.packages = with pkgs; [
    river
    sway
  ];
}
