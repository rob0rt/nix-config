{ ... }:

{
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
      tabstop = 4;
      shiftwidth = 4;
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

    keymaps = import ./keymaps.nix;

    plugins = import ./plugins.nix;
  };
}
