{
  lspconfig.enable = true;

  lazy.enable = true;

  web-devicons.enable = true;

  guess-indent.enable = true;

  barbar = {
    enable = true;

    settings = {
      sidebar_filetypes = {
        "neo-tree" = true;
      };
    };
  };

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
    filesystem = {
      filteredItems = {
        hideDotfiles = false;
        hideGitignored = true;
        neverShow = [ ".git" ];
      };
    };
  };

  lualine = {
    enable = true;
    settings = {
      extensions = [ "neo-tree" ];
      options = {
        section_separators = {
          left = "";
          right = "";
        };
      };
    };
  };

  telescope.enable = true;

  coq-nvim = {
    enable = true;

    settings = {
      auto_start = "shut-up";
    };
  };

  treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
    };
  };

  copilot-lua.enable = true;

  which-key.enable = true;

  indent-blankline.enable = true;
}

