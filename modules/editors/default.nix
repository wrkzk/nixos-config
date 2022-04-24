{ config, pkgs, ... }:

 {
   imports = [
     ./eclipse.nix
     ./neovim.nix
     ./doom.nix
     ./vscodium.nix
   ];

   home.packages = with pkgs; [
     android-studio
     neovide
   ];
 }
