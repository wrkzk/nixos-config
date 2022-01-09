{
  description = "A simple configuration for a NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, home-manager, nixpkgs }:
    let
      nixpkgsConfig = {
        config = { allowUnfree = true; };
      };
    in
  {
    nixosConfigurations.sol = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
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
		];
	      };
            }
        ];
    };

  };
}
