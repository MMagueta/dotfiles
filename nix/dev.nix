{ pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  manual.manpages.enable = true;
  
  home.packages = with pkgs; [
    git-crypt
    taskjuggler
    dotnet-sdk_5
    curl
    wget
    unzip
    gnupg
    sbcl
    openjdk11
    clojure-lsp
    clojure
    ocaml
    opam
    ocamlPackages.ocaml-lsp
    racket-minimal
    rnix-lsp
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
