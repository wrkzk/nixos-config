{ pkgs, config, ... }:

{
  services.wired = {
    enable = true;
    config = ./wired.ron;
  };
};
