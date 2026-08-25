{
  lspconfig.enable = true;

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

    settings = {
      buffers = {
        bind_to_cwd = false;
        follow_current_file = {
          enabled = true;
        };
      };
      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = true;
          never_show = [ ".git" ];
        };
      };
      window = {
        width = 40;
        height = 15;
        auto_expand_width = false;
      };
      enable_diagnostics = true;
      enable_git_status = true;
      enable_modified_markers = true;
      enable_refresh_on_write = true;
      close_if_last_window = true;
      popup_border_style = "rounded";
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
    installArtifacts = true;
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

