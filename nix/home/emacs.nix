{ pkgs, ... }:

let
  emacs-overlay = import (
    builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }
  );
in
{
  nixpkgs.overlays = [ emacs-overlay ];

  programs.emacs = {
    enable = true;
    extraPackages = (
      epkgs:
      (
        with epkgs; [
          nix-mode
          lfe-mode
          tuareg #Ocaml mode
          racket-mode
          lsp-java
          python-mode
          lsp-python-ms
          flycheck
          transpose-frame
          evil
          magit
          vscode-icon
          fsharp-mode
          eglot
          lsp-mode
          org-drill
          elfeed
          shrface
          use-package
          color-theme-sanityinc-tomorrow
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
          haskell-mode
          projectile
          dired-sidebar
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
          haskell-mode
          ein #Emacs IPython Notebook
        ]
      )
    );
  };

  home.file = {
    ".emacs.d" = {
      source = ../../emacs;
      recursive = true;
    };
  };

  xresources.properties = {
    "Emacs.menuBar" = false;
    "Emacs.toolBar" = false;
    "Emacs.verticalScrollBars" = false;
  };

  services.emacs.enable = true;
}
