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
            tuareg #Ocaml mode
            racket-mode
            clojure-mode
            cider
            lsp-java
            python-mode
            lsp-python-ms
            geiser
            scheme-complete
            flycheck
            magit
            vscode-icon
            fsharp-mode
            eglot
            lsp-mode
            org-drill
            use-package
            color-theme-sanityinc-tomorrow
            swiper
            slime
            eglot-fsharp
            company-quickhelp
            python-mode
            helm
            multiple-cursors
            plantuml-mode
            eshell-syntax-highlighting
            org-bullets
            projectile
            dired-sidebar
            dashboard
            powerline
          ]
        )
    );
  };

  #home.file = {
  #  ".emacs.d" = {
  #    source = ./MageMacs;
  #    recursive = true;
  #  };
  #};

  xresources.properties = {
    "Emacs.menuBar" = false;
    "Emacs.toolBar" = false;
    "Emacs.verticalScrollBars" = false;
  };

  services.emacs.enable = true;
}
