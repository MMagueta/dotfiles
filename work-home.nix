{ config, pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
  
  home = {
    stateVersion = "22.05";
    username = "marcmagueta";
    homeDirectory = "/home/marcmagueta";
  };

  programs.bash = {
    enable = true;
    initExtra = ''
       export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    '';
  };

  services.udiskie = {
    enable = true;
    automount = true;
  };
  
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    htop
    firefox
    git-crypt
    gnupg
    wget
    # plantuml
    gnutls
    rnix-lsp
    neofetch
    niv
    # python310
    netcoredbg
    dotnet-sdk
    icu # FSAutocomplete dependency
    emacs
    # vscode
  ];

  programs.home-manager.enable = true;

  programs.emacs = {
    enable = false;
    # package = pkgs.emacsGcc;
    extraPackages = epkgs: with epkgs; [
      use-package
    ];
  };

  programs.git = {
    enable = true;
    userName = "Marcos Magueta";
    lfs.enable = true;
    delta.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    sshKeys = ["9AA3054F8732794A8B33510B5B9E5F9D7211E7B1"];
  };
}
