{
  description = "A simple configuration for a NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, home-manager, nixpkgs, neovim-nightly }:
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
	    nix = {
	      binaryCaches = [
	        "https://nix-community.cachix.org"
	      ];
	      binaryCachePublicKeys = [
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
		  ./hosts/sol/home.nix
		  ./modules/neovim.nix
                  ./modules/alacritty.nix
                  ./modules/fish.nix
		];
	      };
            }
        ];
    };

  };
}
