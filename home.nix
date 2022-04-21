{ config, pkgs, lib, ... }:
let
  dotnet-overlay = import ~/.config/overlay-dotnet6.nix;
in
{
  home.stateVersion = "22.05";
  
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  nixpkgs.overlays = [
    dotnet-overlay
  ];

  home.packages = with pkgs; [
    ispell
    cask # for emacs flycheck-elsa
    wget
    sqls
    # scala
    # sbt
    # metals
    nodejs
    # clojure
    # clojure-lsp
    # jdk11
    plantuml
    # sbcl
    # swiProlog
    gnupg
    gnutls
    dotnet-sdk
    # netcoredbg
    powershell
    # gforth
    python39Packages.nbconvert
    poetry
    hy
    python39Packages.virtualenv
    git-crypt
    rnix-lsp
    neofetch
    kubectl
    azure-cli
    nix-index
    niv
  ] ++ lib.optionals stdenv.isDarwin [
    # m-cli
  ];

  programs.git = {
    enable = true;
    userName = "Marcos Magueta";
    delta = {
      enable = true;
    };
    lfs = {
      enable = true;
    };
    includes = [
      {
        condition = "gitdir/i:~/Project/Personal/";
        contents = {
          user = {
            name = "Marcos Magueta";
            email = "maguetamarcos@gmail.com";
            signingKey = "0AD3A1263F9DE73E";
          };
          commit = {
            gpgSign = true;
          };
        };
      }
      {
        condition = "gitdir/i:~/Project/Work/";
        contents = {
          user = {
            name = "Marcos Magueta";
            email = "marcosmagueta@datarisk.io";
            signingKey = "E6780F25531C589F";
          };
          commit = {
            gpgSign = true;
          };
        };
      }
      {
        condition = "gitdir/i:~/.emacs.d/";
        contents = {
          user = {
            name = "Marcos Magueta";
            email = "maguetamarcos@gmail.com";
            signingKey = "0AD3A1263F9DE73E";
          };
          commit = {
            gpgSign = true;
          };
        };
      }
    ];
      
  };
}
