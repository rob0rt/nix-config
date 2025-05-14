{
  description = "rob0rt's home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
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
        nixvim.homeManagerModules.nixvim
        ./home.nix
      ];
      extraSpecialArgs = { inherit host; };
    };
  in {
    homeConfigurations = {
      "Robert.Lynch@alaskaair.com@SEAHGRLYNCHR" = homeManagerConfiguration "seahgrlynchr";
      "rmlynch@Nyx" = homeManagerConfiguration "nyx";
    };
  };
}
