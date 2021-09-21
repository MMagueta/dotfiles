{ pkgs, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in
{

  home.packages = with pkgs; [
    unstable.discord
    firefox
    # gnome.gnome-tweaks
    inkscape
    pavucontrol
    obs-studio
    vlc
    electrum
    minecraft
    calibre
  ];

}
