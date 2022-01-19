{ config, pkgs, ... }:

 {
   imports = [
     ./eclipse.nix
     ./neovim.nix
   ];

   home.packages = with pkgs; [
     android-studio
   ];
 }
