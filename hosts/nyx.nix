{ lib, ... }:

{
  arch = "x86_64-linux";

  username = "rmlynch";
  homeDirectory = "/home/rmlynch";

  user = {
    email = "robertlynch2012@gmail.com";
  };

  packages = pkgs: with pkgs; [];

  programs = {
    # Swiftly installed manually
    zsh.initContent = lib.mkOrder 1500 ''
      . ~/.local/share/swiftly/env.sh
    '';
  };
}
