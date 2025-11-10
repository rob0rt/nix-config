{ ... }:

{
  arch = "aarch64-darwin";

  username = "rmlynch";
  homeDirectory = "/Users/rmlynch";

  user = {
    email = "robertlynch2012@gmail.com";
  };

  packages = pkgs: with pkgs; [
    rustup
    devpod
  ];

  programs = {};
}
