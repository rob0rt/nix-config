{ host, ... }:

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
}
