{
  lazy.enable = true;

  web-devicons.enable = true;

  guess-indent.enable = true;

  bufferline = {
    enable = true;

    settings = {
      options = {
          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              highlight = "Directory";
              separator = true;
            }
          ];
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
  }

