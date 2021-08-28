{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "mmagueta";
  home.homeDirectory = "/home/mmagueta/";

  nixpkgs.config.allowUnfree = true;
  
  imports =
    [ 
        ./emacs.nix
        ./social.nix
        ./dev.nix
        ./theme.nix
    ];
}
