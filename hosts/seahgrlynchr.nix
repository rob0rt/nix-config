{ lib, ... }:

let
  email = "Robert.Lynch@alaskaair.com";
in {
  username = email;
  homeDirectory = "/Users/${email}";

  user = {
    name = "Robert Lynch";
    email = lib.toLower email;
  };
}
