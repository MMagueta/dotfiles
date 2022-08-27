{ config, pkgs, ... }:
{

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    extensions = with pkgs.vscode-extensions; [
      ms-vsliveshare.vsliveshare
    ];
  };
  
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
  
  home = {
    stateVersion = "22.05";
    username = "mmagueta";
    homeDirectory = "/home/mmagueta";
  };

  services.udiskie = {
    enable = true;
    automount = true;
  };
  
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fstar
    gcc
    smlnj
    feh
    htop
    ocaml
    opam
    ocamlPackages.ocaml-lsp
    ocamlPackages.reason
    ocamlPackages.merlin
    nodePackages.esy
    dune_2
    discord
    insomnia
    docker-compose
    firefox
    git-crypt
    gnupg
    ghc
    haskell-language-server
    stack
    cabal-install
    wget
    plantuml
    gnutls
    rnix-lsp
    neofetch
    niv
    python310
    lfe
    erlangR25
    erlang-ls
    rebar3
    # eclipses.eclipse-java
    netcoredbg
    dotnet-sdk
    icu # FSAutocomplete dependency
    # vscode-fhs
    emacs
    zulip
    sbcl
    git
    gimp
    jetbrains.rider
  ];

  programs.zsh = {
    enable = true;
    initExtra = ''
       export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "dotnet" ];
      theme = "robbyrussell";
    };
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Marcos Magueta";
    lfs.enable = true;
    delta.enable = true;
  };

  programs.alacritty = {
    enable = true;
  };
  
  # programs.git = {
  #   enable = true;
  #   userName = "Marcos Magueta";
  #   delta = {
  #     enable = true;
  #   };
  #   lfs = {
  #     enable = true;
  #   };
  #   includes = [
  #     {
  #       condition = "gitdir/i:~/Project/Personal/";
  #       contents = {
  #         user = {
  #           name = "Marcos Magueta";
  #           email = "maguetamarcos@gmail.com";
  #           signingKey = "0AD3A1263F9DE73E";
  #         };
  #         commit = {
  #           gpgSign = true;
  #         };
  #       };
  #     }
  #     {
  #       condition = "gitdir/i:~/Project/Work/";
  #       contents = {
  #         user = {
  #           name = "Marcos Magueta";
  #           email = "marcosmagueta@datarisk.io";
  #           signingKey = "E6780F25531C589F";
  #         };
  #         commit = {
  #           gpgSign = true;
  #         };
  #       };
  #     }
  #     {
  #       condition = "gitdir/i:~/.emacs.d/";
  #       contents = {
  #         user = {
  #           name = "Marcos Magueta";
  #           email = "maguetamarcos@gmail.com";
  #           signingKey = "0AD3A1263F9DE73E";
  #         };
  #         commit = {
  #           gpgSign = true;
  #         };
  #       };
  #     }
  #   ];  
  # };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    sshKeys = [ "9AA3054F8732794A8B33510B5B9E5F9D7211E7B1" ];
  };
}
