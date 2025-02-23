{ host, ... }:

{
  programs.git = {
    enable = true;
    userName = host.user.name;
    userEmail = host.user.email;
    extraConfig = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
    };
  };
}
