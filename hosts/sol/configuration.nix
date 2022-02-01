{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Kernel and bootloader options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Networking options
  networking = {
    hostName = "sol";
    networkmanager.enable = true;
  };

  # Localization options
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Xorg options
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    libinput.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User account options
  users = {
    mutableUsers = false;
    users.warren = {
      isNormalUser = true;
      hashedPassword = "$6$GENzGew82/xzgA2f$2tO36hLmjPG3aabC/Lv6tppZTNc.DIe5TJypEU3wcTywu4ffEImjChLc4VbSeMy9gtKW3bEVkR5nxRFUcy3BS.";
      extraGroups = [ "wheel" "networkmanager" "tilp" "adbusers" "libvirtd" ];
    };
    users.root = {
      hashedPassword = "$6$rlge4sqneKLy6q/X$DsJL33yz4z8wOsI52oGUIyBP/JHK3EBg.UvDkW664yEekH2YShQ431OcOzMZ1esLDymY/kJetmwZr7EFYqKBI.";
    };
  };

  programs.adb.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  environment.systemPackages = with pkgs; [
    (pkgs.writeScriptBin "fs-diff" ''
      #!${pkgs.stdenv.shell}
      alias btrfs="${pkgs.btrfs-progs}/bin/btrfs"
      alias sudo="${pkgs.sudo}/bin/sudo"
      
      set -euo pipefail
      
      OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/root-blank 9999999)
      OLD_TRANSID=''${OLD_TRANSID#transid marker was }
      
      sudo btrfs subvolume find-new "/mnt/root" "$OLD_TRANSID" |
      sed '$d' |
      cut -f17- -d' ' |
      sort |
      uniq |
      while read path; do
        path="/$path"
        if [ -L "$path" ]; then
          : # The path is a symbolic link, so is probably handled by NixOS already
        elif [ -d "$path" ]; then
          : # The path is a directory, ignore
        else
          echo "$path"
        fi
      done
    '')
    virt-manager
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka", "Monoid" ]; })
  ];

  environment.etc = {
    nixos.source = "/persist/etc/nixos";
    "NetworkManager/system-connections".source = "/persist/etc/NetworkManager/system-connections";
    adjtime.source = "/persist/etc/adjtime";
    NIXOS.source = "/persist/etc/NIXOS";
    machine-id.source = "/persist/etc/machine-id";
  };

  systemd.tmpfiles.rules = [
    "L /var/lib/NetworkManager/secret_key - - - - /persist/var/lib/NetworkManager/secret_key"
    "L /var/lib/NetworkManager/seen-bssids - - - - /persist/var/lib/NetworkManager/seen-bssids"
    "L /var/lib/NetworkManager/timestamps - - - - /persist/var/lib/NetworkManager/timestamps"
  ];

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  boot.initrd.postDeviceCommands = pkgs.lib.mkBefore ''
    mkdir -p /mnt

    mount -o subvol=/ /dev/mapper/enc /mnt

    btrfs subvolume list -o /mnt/root |
    cut -f9 -d' ' |
    while read subvolume; do
      echo "deleting /$subvolume subvolume..." &&
      btrfs subvolume delete "/mnt/$subvolume"
    done &&
    echo "deleting /root subvolume..." &&
    btrfs subvolume delete /mnt/root

    echo "restoring blank /root subvolume..."
    btrfs subvolume snapshot /mnt/root-blank /mnt/root

    umount /mnt
  ''; 

  system.stateVersion = "21.11";

}

