{ pkgs, config, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in
{
  
  home.packages = with pkgs; [
    unstable.discord
    firefox
    nyxt
    # tor-browser-bundle-bin
    # gnome.gnome-tweaks
    inkscape
    pavucontrol
    obs-studio
    vlc
    electrum
    minecraft
    calibre
    wine
    winetricks
    # teams
  ];  
}
