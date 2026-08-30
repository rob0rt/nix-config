{
  description = "rob0rt's home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    llm-agents,
    ...
  }: let
    homeManagerConfiguration = hostname: let
      host = import ./hosts/${hostname}.nix { inherit (nixpkgs) lib; };
    in home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "${host.arch}";
      };
      modules = [
        nixvim.homeModules.nixvim
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit host;
        llm-agents = llm-agents.packages.${host.arch};
      };
    };
  in {
    homeConfigurations = {
      "rmlynch@Nyx" = homeManagerConfiguration "nyx";
      "rmlynch@calliope" = homeManagerConfiguration "calliope";
      "rmlynch@pontus" = homeManagerConfiguration "pontus";
    };
  };
}
