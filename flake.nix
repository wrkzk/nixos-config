{
  description = "A simple configuration for a NixOS system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    wired.url = "github:Toqozz/wired-notify";
  };

  outputs = { self, home-manager, nixpkgs, neovim-nightly, nix-doom-emacs, nixpkgs-f2k, wired }:
  let
      system = "x86_64-linux";
      nixpkgsConfig = {
        config = { allowUnfree = true; };
      };
      overlays = [
        (self: super: import ./packages { pkgs = super; })
        (self: super: {
          mathematica = super.mathematica.overrideAttrs (old: {
            version = "12.3.1";
            sha256 = "51b9cab12fd91b009ea7ad4968a2c8a59e94dc55d2e6cc1d712acd5ba2c4d509";
            installer = "Mathematica_12.3.1_LINUX.sh";
          });
        })
#        (self: super: { discord = super.discord.overrideAttrs (_: { 
#          src = "https://discord.com/api/download?platform=linux&format=tar.gz";
#          setSourceRoot="sourceRoot=`pwd`";
#        });})
        neovim-nightly.overlay
        nixpkgs-f2k.overlay
        wired.overlays.${system}
      ];
    in
  {
    nixosConfigurations.sol = nixpkgs.lib.nixosSystem {
      inherit system;
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
                home.stateVersion = "21.11";
	        imports = [
                  nix-doom-emacs.hmModule
                  wired.homeManagerModules.default
		  ./modules/browsers
                  ./modules/dev
                  ./modules/editors
                  ./modules/programs
                  ./modules/xorg
                  ./modules/wayland
                  ./modules/misc
                  ./modules/chat
                ];
	      };
            }
        ];
    };

  };
}
