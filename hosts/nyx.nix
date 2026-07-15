{ lib, ... }:

{
  arch = "x86_64-linux";

  username = "rmlynch";
  homeDirectory = "/home/rmlynch";

  user = {
    email = "robertlynch2012@gmail.com";
  };

  packages = pkgs: with pkgs; [];

  programs = pkgs: {
    # Swiftly installed manually
    zsh.initContent = lib.mkOrder 1500 ''
      . ~/.local/share/swiftly/env.sh
    '';

    opencode = {
      enable = true;
      package = pkgs.llm-agents.opencode;
      settings = {
        plugin = [ "opencode-models-discovery@latest" ];
        provider = {
          lemonade = {
            npm = "@ai-sdk/openai-compatible";
            name = "Lemonade";
            options = {
              baseURL = "http://192.168.1.226:13305/v1";
              modelsDiscovery.enabled = true;
            };
          };
        };
      };
    };
  };
}
