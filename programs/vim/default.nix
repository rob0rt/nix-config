{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorschemes.tokyonight.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
    };

    nixpkgs = {
      config = {
        allowunfree = true;
      };
    };

    lsp = {
      servers = {
        gopls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        svelte.enable = true;
      };
    };

    keymaps = import ./keymaps.nix;

    plugins = import ./plugins.nix;
  };
}
