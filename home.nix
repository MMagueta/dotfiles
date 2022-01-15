{ config, pkgs, lib, ... }:
let 
  emacs-overlay = import (
    builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }
  );
in
{
  home.stateVersion = "22.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [
    # Dev stuff
    dotnet-sdk
    nodejs
    gnupg
    git
    git-crypt
    rnix-lsp
    neofetch
    niv # easy dependency management for nix projects

  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

  # Misc configuration files --------------------------------------------------------------------{{{

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

  # Emacs -----------------------------------------------------------------
  nixpkgs.overlays = [ emacs-overlay ];

  programs.emacs = {
    enable = true;
    extraPackages = (
      epkgs:
      (
        with epkgs; [
          nix-mode
          tuareg #Ocaml mode
          python-mode
          lsp-python-ms
          flycheck
          transpose-frame
          magit
          fsharp-mode
          lsp-mode
          org-drill
          elfeed
          shrface
          use-package
          swiper
          slime
          auto-complete # common lisp auto completion
          company-quickhelp
          python-mode
          helm
          multiple-cursors
          plantuml-mode
          eshell-syntax-highlighting
          org-bullets
          projectile
          dashboard
          powerline
          lsp-ui
          dash
          s
          yasnippet
          hy-mode
          smartparens
          rainbow-mode
          rainbow-delimiters
          rainbow-blocks
          ein #Emacs IPython Notebook
        ]
      )
    );
  };
}
