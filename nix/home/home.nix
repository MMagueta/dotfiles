{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "mmagueta";
  home.homeDirectory = "/home/mmagueta/";

  nixpkgs.config.allowUnfree = true;
  
  imports =
    [
        # ./stumpwm.nix
        ./emacs.nix
        ./media.nix
        ./dev.nix
    ];
}
