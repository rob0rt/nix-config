{ lib, ... }:

let
  email = "Robert.Lynch@alaskaair.com";
in {
  arch = "aarch64-darwin";

  username = email;
  homeDirectory = "/Users/${email}";

  user = {
    email = lib.toLower email;
  };

  packages = pkgs: with pkgs; [
    nodejs_24
    corepack_24
    azure-cli
    temporal-cli
    unstable.go
    unstable.fastlane
    unstable.svelte-language-server
  ];

  programs = {
    vscode.enable = true;
  };
}
