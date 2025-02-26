{ pkgs, ... } :

{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscodium;

    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
    ];

    userSettings = {
      "workbench.colorTheme" = "Dracula Theme";
    };
  };
}
