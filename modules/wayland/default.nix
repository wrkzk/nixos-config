{ config, pkgs, ...}:

{
  imports = [
    ./waybar.nix
    ./foot.nix
    ./eww.nix
    ./fnott.nix
  ];

  home.packages = with pkgs; [
    river
    ristate
    swaybg
    bemenu
    ly
  ];
}
