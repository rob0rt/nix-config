{
  description = "rob0rt's home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: let
    homeManagerConfiguration = hostname: let
      host = import ./hosts/${hostname}.nix { inherit (nixpkgs) lib; };
    in home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${host.arch};
      modules = [
        nixvim.homeManagerModules.nixvim
        ./home.nix
      ];
      extraSpecialArgs = { inherit host; };
    };
  in {
    homeConfigurations = {
      "Robert.Lynch@alaskaair.com@SEAHGRLYNCHR" = homeManagerConfiguration "seahgrlynchr";
    };
  };
}
