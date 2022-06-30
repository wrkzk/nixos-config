{ config, pkgs, ...}:

{
  imports = [
    ./waybar.nix
    ./foot.nix
    ./eww.nix
    ./wired-notify.nix
  ];

  home.packages = with pkgs; [
    river
    ristate
    swaybg
    bemenu
  ];
}
