{ pkgs, config, ... }:

{
  #services.mpd = {
  #  enable = true;
  #  musicDirectory = ~/mus;
  #  network.listenAddress = "127.0.0.1";
  #  network.port = 6600;
  #  extraConfig = ''
  #    audio_output {
  #      type "pulse"
  #      name "pulse audio"
  #      device "pulse"
  #      mixer_type "hardware"
  #    }
  #
  #    audio_output {
  #      type "fifo"
  #      name "mpd_fifo"
  #      path "/tmp/mpd.fifo"
  #      format "44100:16:2"
  #    }
  #  '';
  #};
  programs.ncmpcpp = {
    enable = false;
    settings = {
      mpd_music_dir = "/home/warren/music";
    };
  };
}
