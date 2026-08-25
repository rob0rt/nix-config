{ lib, ... }:

{
  arch = "x86_64-linux";

  username = "rmlynch";
  homeDirectory = "/home/rmlynch";

  user = {
    email = "robertlynch2012@gmail.com";
  };

  packages = { ... }: [];

  programs = { llm-agents, ... }: {
    # Swiftly installed manually
    zsh.initContent = lib.mkOrder 1500 ''
      . ~/.local/share/swiftly/env.sh
    '';

    opencode = {
      enable = true;
      package = llm-agents.opencode;
      settings = {
        permission = {
          external_directory = {
            "~/.cargo/**" = "allow";
          };
        };
      };
    };
  };
}
