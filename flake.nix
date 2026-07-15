{
  description = "rob0rt's home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixvim,
    llm-agents,
    ...
  }@inputs: let
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
      "rmlynch@Nyx" = homeManagerConfiguration "nyx";
      "rmlynch@calliope" = homeManagerConfiguration "calliope";
    };
  };
}
