{ host, ... }:

{
  programs.git = {
    enable = true;
    userName = "Robert Lynch";
    userEmail = host.user.email;
    extraConfig = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";

      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Robert Lynch";
        email = host.user.email;
      };
    };
  };
}
