{ config, pkgs, ... }:

 {
   imports = [
     ./eclipse.nix
     ./neovim.nix
     ./doom.nix
   ];

   home.packages = with pkgs; [
     android-studio
   ];
 }
