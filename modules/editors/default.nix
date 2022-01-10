{ config, pkgs, ... }:

 {
   imports = [
     ./eclipse.nix
     ./neovim.nix
   ];
 }
