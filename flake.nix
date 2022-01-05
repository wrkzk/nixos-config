{
  description = "A simple configuration for a NixOS system";
  nixConfig.extra-experimental-features = "nix-command flakes";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
    };

  };
}
