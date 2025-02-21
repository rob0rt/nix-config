{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "Robert.Lynch@alaskaair.com";
  home.homeDirectory = "/Users/Robert.Lynch@alaskaair.com";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

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

  programs.git = {
    enable = true;
    userName = "Robert Lynch";
    userEmail = "robert.lynch@alaskaair.com";
    extraConfig = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
    };
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorschemes.dracula-nvim.enable = true;

    opts = {
      number = true;
      relativenumber = true;
    };

    plugins = {

      lazy.enable = true;

      web-devicons.enable = true;

      bufferline.enable = true;

      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
        popupBorderStyle = "rounded";
        buffers = {
          bindToCwd = false;
          followCurrentFile = {
            enabled = true;
          };
        };
        window = {
          width = 40;
          height = 15;
          autoExpandWidth = false;
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            section_separators = {
              left = "";
              right = "";
            };
          };
        };
      };
    };
  };
}
