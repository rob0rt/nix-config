{
  description = "rob0rt's home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }@inputs: let
    homeManagerConfiguration = hostname: let
      host = import ./hosts/${hostname}.nix { inherit (nixpkgs) lib; };
    in home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "${host.arch}";
        overlays = import ./overlays.nix { inherit inputs; };
      };
      modules = [
        nixvim.homeModules.nixvim
        ./home.nix
      ];
      extraSpecialArgs = { inherit host; };
    };
  in {
    homeConfigurations = {
      "Robert.Lynch@alaskaair.com@SEAHGRLYNCHR" = homeManagerConfiguration "seahgrlynchr";
      "rmlynch@Nyx" = homeManagerConfiguration "nyx";
      "rmlynch@calliope" = homeManagerConfiguration "calliope";
    };
  };
}
