{ pkgs, host, ... }:

{
  home.username = host.username;
  home.homeDirectory = host.homeDirectory;

  home.stateVersion = "24.11";

  imports = [
    ./programs/git.nix
    ./programs/vim
    ./programs/vscode.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    lazygit
    hurl
    unstable.posting
  ]
  ++ (host.packages pkgs);

  home.file = {
    ".config/wezterm" = {
      source = ./configs/wezterm;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";

    # npm keys rotated and corepack-installed tools are hard-coded to the old one
    COREPACK_INTEGRITY_KEYS = "0";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "jujutsu-0.23.0"
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      history = {
        append = true;
      };
    };

    starship = {
      enable = true;
      settings = pkgs.lib.importTOML ./configs/starship.toml;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };
  } // host.programs;
}
