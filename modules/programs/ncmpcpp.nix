{ pkgs, config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/mus";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;
  };
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/mus";
  };
}
