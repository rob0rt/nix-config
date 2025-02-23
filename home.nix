{ config, pkgs, host, ... }:

{
  home.username = host.username;
  home.homeDirectory = host.homeDirectory;

  home.stateVersion = "24.11";

  imports = [
    ./programs/git.nix
    ./programs/vim
  ];

  home.packages = [
    pkgs.ripgrep
    pkgs.nodejs_23
    pkgs.corepack_23
    pkgs.jujutsu
    pkgs.lazygit
  ];

  home.file = {
    ".config/wezterm" = {
      source = ./configs/wezterm;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    history = {
      append = true;
    };
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./configs/starship.toml;
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    enableZshIntegration = true;
  };
}
