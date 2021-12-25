{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "mmagueta";
  home.homeDirectory = "/home/mmagueta/";
  
  imports =
    [
        ./dev.nix
    ];
}
