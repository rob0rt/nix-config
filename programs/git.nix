{ host, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Robert Lynch";
    userEmail = host.user.email;
    extraConfig = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
    };
  };

  programs.jujutsu = {
    enable = true;

    package = pkgs.unstable.jujutsu;

    settings = {
      user = {
        name = "Robert Lynch";
        email = host.user.email;
      };
    };
  };
}
