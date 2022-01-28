{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    experimentalBackends = true;
    fade = true;
    fadeDelta = 10;
  };
}
