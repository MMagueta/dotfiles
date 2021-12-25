{ pkgs, ... }:
let
  #dotnet-overlay = import ./dotnet5-overlay.nix;
in
{
  manual.manpages.enable = true;

  nixpkgs.overlays = [ 
    # dotnet-overlay
  ];

  home.packages = with pkgs; [
    git-crypt
    nodejs
    # taskjuggler
    # dotnet-sdk_5
    # curl
    # wget
    # clang
    # libcxx
    python38
    # unzip
    # gnupg
    sbcl
    # openjdk11
    # plantuml
    # graphviz
    # ocaml
    # opam
    # ocamlPackages.ocaml-lsp
    # ocamlPackages.utop
    # racket-minimal
    rnix-lsp
    neofetch
    # texlive.combined.scheme-full
    lispPackages.quicklisp
    # lfe
    # hy
    # factor-lang
    # jupyter
    # jetbrains.rider
    # patchelf
  ];

  programs.git = {
    enable = true;

    userEmail = "maguetamarcos@gmail.com";
    userName = "Marcos Magueta";

    delta = {
      enable = true;
    };

    lfs = {
      enable = true;
    };

  };
}
