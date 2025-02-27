{ pkgs, ... } :

{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscodium;

    extensions = with pkgs.unstable.vscode-extensions; [
      dracula-theme.theme-dracula
      esbenp.prettier-vscode
      vscode-icons-team.vscode-icons
    ];

    userSettings = {
      "workbench.colorTheme" = "Dracula Theme";
      "workbench.iconTheme" = "vscode-icons";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };
}
