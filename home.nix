{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    neofetch
    firefox
    discord
  ];

  programs.neovim = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "wrkzk@protonmail.com";
    userName = "wrkzk";
  };
}
