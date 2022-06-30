{ config, pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    desktop = "$HOME/tmp";
    documents = "$HOME/doc";
    download = "$HOME/tmp";
  };
}
