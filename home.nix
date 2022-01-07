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

  programs.java = {
    enable = true;
    package = pkgs.jdk;
  };

  programs.eclipse = {
    enable = true;
    package = pkgs.eclipses.eclipse-java;
  };

  xsession.windowManager.awesome = {
    enable = true;
  };

  home.file = {
    "awesome" = {
      source = ./awesome;
      target = ".config/awesome";
    };
  };
}
