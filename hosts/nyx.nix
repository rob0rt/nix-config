{ lib, ... }:

{
  arch = "x86_64-linux";

  username = "rmlynch";
  homeDirectory = "/home/rmlynch";

  user = {
    email = "robertlynch2012@gmail.com";
  };

  packages = pkgs: with pkgs; [
    rustup
    nodejs_24
    corepack_24
  ];

  programs = {};
}
