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

  home.file.".config/awesome/rc.lua".source = ./awesome/rc.lua;
  home.file.".config/awesome/themes/default/theme.lua" = ./awesome/themes/default/theme.lua;
}
