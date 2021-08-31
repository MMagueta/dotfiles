let
  pkgs = import (
    builtins.fetchGit {
      # Descriptive name to make the store path easier to identify                
      name = "my-old-revision";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/nixpkgs-unstable";
      rev = "f19bb8321aad93efd9c024f9b7f6eca49db1d4c8";
    }
  ) {};

  old-adwaita = pkgs.gnome3.adwaita-icon-theme;
in
{

  home.packages = with pkgs; [
    old-adwaita
  ];

}
