{ config, pkgs, lib, ... }:
{
  home.stateVersion = "22.05";
  
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  nixpkgs.overlays = [];

  home.packages = with pkgs; [
    gnumake
    # haskell.compiler.ghc8107
    # haskell.packages.ghc8107.cabal-install
    # haskell.packages.ghc8107.haskell-language-server
    # stack
    # hlint
    fstar
    z3
    htop
    ispell
    cask
    wget
    sqls
    plantuml
    sbcl
    # swiProlog
    gnupg
    gnutls
    dotnet-sdk
    # netcoredbg
    git-crypt
    rnix-lsp
    neofetch
    nix-index
    ocaml
    opam
    dune_2
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlbuild
    niv
    gcc
  ] ++ lib.optionals stdenv.isDarwin [
    # m-cli
  ];

  programs.git = {
    enable = true;
    userName = "Marcos Magueta";
    delta.enable = true;
    lfs.enable = true;
    userEmail = "maguetamarcos@gmail.com";
    signing = {
       key = "CE25E21959B460A84BDFB93F0AD3A1263F9DE73E";
       signByDefault = true;
    };
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
       export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
       gpgconf --launch gpg-agent
    '';
  };

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  #   sshKeys = ["9AA3054F8732794A8B33510B5B9E5F9D7211E7B1"];
  # };
}
