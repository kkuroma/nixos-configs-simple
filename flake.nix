{
  description = "simple nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscodium-server = {
      url = "github:unicap/nixos-vscodium-server";
      flake = false; # its outputs eval x86_64-darwin, dropped in nixpkgs 26.11
    };
  };

  outputs = { nixpkgs, disko, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        ./disko.nix
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
