{ pkgs, ... } :

{
  programs.vscode = {
    package = pkgs.unstable.vscodium;

    profiles.default = {
      extensions = with pkgs.unstable.vscode-extensions; [
        dracula-theme.theme-dracula
        esbenp.prettier-vscode
        vscode-icons-team.vscode-icons
        yoavbls.pretty-ts-errors
        bradlc.vscode-tailwindcss
        golang.go
        svelte.svelte-vscode
        rust-lang.rust-analyzer
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
        "[svelte]" = {
          "editor.defaultFormatter" = "svelte.svelte-vscode";
        };
        "svelte.enable-ts-plugin" = true;
        "git.confirmSync" = false;
      };
    };
  };
}
