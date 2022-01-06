{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    neofetch
    pfetch
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

  xsession.windowManager.awesome = {
    enable = true;
  };

  home.file.".config/awesome/rc.lua".source = ./awesome/rc.lua;
}
