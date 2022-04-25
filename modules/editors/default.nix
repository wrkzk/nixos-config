{ config, pkgs, ... }:

 {
   imports = [
     ./eclipse.nix
     ./neovim.nix
     ./doom.nix
     ./vscode.nix
   ];

   home.packages = with pkgs; [
     android-studio
     neovide
   ];
 }
