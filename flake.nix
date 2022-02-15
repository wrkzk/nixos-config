{
  description = "A simple configuration for a NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = { self, home-manager, nixpkgs, neovim-nightly, nix-doom-emacs }:
    let
      nixpkgsConfig = {
        config = { allowUnfree = true; };
      };
      overlays = [
        neovim-nightly.overlay
      ];
    in
  {
    nixosConfigurations.sol = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
	  {
	    nixpkgs.overlays = overlays;
	    nix.settings = {
	       substituters = [
	        "https://nix-community.cachix.org"
	      ];
	      trusted-public-keys = [
	        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
	      ];
	    };
	  }
          ./hosts/sol/configuration.nix
          home-manager.nixosModules.home-manager {
	    nixpkgs = nixpkgsConfig;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.warren = { pkgs, config, ... }:
	      {
	        imports = [
                  nix-doom-emacs.hmModule
		  ./modules/browsers
                  ./modules/dev
                  ./modules/editors
                  ./modules/programs
                  ./modules/xorg
                  ./modules/wayland
		];
	      };
            }
        ];
    };

  };
}
