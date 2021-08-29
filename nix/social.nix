{ pkgs, ... }:

{

  home.packages = with pkgs; [
    discord
    firefox
    gnome.gnome-tweaks
  ];

}
