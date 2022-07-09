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
        config = {
          allowUnfree = true;
        };
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
        (self: super: {
          lemonbar-xft = super.lemonbar-xft.overrideAttrs (old: {
            src = super.fetchFromGitHub {
              owner = "e-zk";
              repo = "lemonbar-xft";
              rev = "ffaeb0104e2232abc96bafbacd3da2021a2f4a02";
              sha256 = "DAVtAUVvSdNOan5tOc/ZYwyubuFo11BnGGz99CEu4UA=";
            };
          });
        })
        (self: super: {
          siji-ng = super.siji.overrideAttrs (old: {
            src = super.fetchFromGitHub {
              owner = "mxkrsv";
              repo = "siji-ng";
              rev = "b3fdf6bbab17eaa13c62b8c4a4404fca5c337181";
              sha256 = "QG4YSszf+Jvj7b4LtIFkdh0D9nKGLmEcFTttxSJ5lL4=";
            };
          });
        })
        neovim-nightly.overlay
        nixpkgs-f2k.overlay
        wired.overlays.${system}
        (self: super:
          let
            deps = with super.pkgs.perlPackages; [
              HTTPDate
              HTTPMessage
              LWP
              LWPUserAgent
              URI
              StringShellQuote
              TextSprintfNamed
              TryTiny
              EncodeLocale
              LWPProtocolHttps
            ];
          in {
            irssi-override = super.irssi.overrideAttrs (old: {
              buildInputs = old.buildInputs ++ [ super.pkgs.makeWrapper ] ++ deps;
              postFixup = ''
                wrapProgram "$out/bin/irssi" --prefix PERL5LIB : "${super.pkgs.perlPackages.makePerlPath deps}"
              '';
            });
          }
        )
        (self: super:
          {
            weechat = super.weechat.override {
              configure = { availablePlugins, ... }: {
                scripts = with super.weechatScripts; [
                  weechat-notify-send
                ];
              };
            };
          }
        )
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
