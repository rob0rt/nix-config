{ lib, ... }:

let
  email = "Robert.Lynch@alaskaair.com";
in {
  arch = "aarch64-darwin";

  username = email;
  homeDirectory = "/Users/${email}";

  user = {
    email = lib.toLower email;
  };
}
