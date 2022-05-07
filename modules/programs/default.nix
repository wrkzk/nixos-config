{ config, pkgs, ... }:

let
  dash-to-dock-42 = pkgs.gnomeExtensions.dash-to-dock.overrideAttrs (oldAttrs: rec {
    src = pkgs.fetchFromGitHub {
      owner = "micheleg";
      repo = "dash-to-dock";
      rev = "ce45bfe0666592038477235e6ac776385dfd884f";
      sha256 = "sha256-w5I2Eeb47YeftJwIhmInUJzB24ty+q1rR9bYJ9VgmFI=";
    };
  });
in {
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    neofetch
    pfetch
    
    foot

    discord
    nheko
    matrix-commander
    betterdiscordctl
    signal-desktop
    scrcpy

    polymc
    multimc-cracked
    bintools-unwrapped
    file
    patchelf

    cbonsai
    zoom-us
    unzip
    zip

    mathematica-latest
    virt-manager

    sysfsutils
    grub2
    xorriso
    
    # Awesomewm libraries
    bling
    rubato
    lain

    kitty
    wmctrl
    libsForQt5.full

    blender
    steam

    #soco-cli
    gnomeExtensions.pop-shell
    gnomeExtensions.pop-launcher-super-key
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    gnome.gnome-terminal
    gnome.polari
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.cpu-power-manager
    dash-to-dock-42
    gnomeExtensions.dash-to-panel
    gnome.gnome-keyring
    fractal

    libsForQt5.bismuth
    libsForQt5.krunner
    latte-dock

    #mullvad
    mullvad-vpn

    realvnc-vnc-viewer
    inkscape
  ];
}
