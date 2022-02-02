{ config, pkgs, lib, ... }:
{
  home.stateVersion = "22.05";
  
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [
    ispell
    wget
    dotnet-sdk
    ispell
    nodejs
    gnupg
    git
    python39Packages.nbconvert
    git-crypt
    rnix-lsp
    neofetch
    kubectl
    azure-cli
    nix-index
    niv
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli
  ];
  programs.git = {
    enable = true;
    userEmail = "maguetamarcos@gmail.com";
    userName = "Marcos Magueta";
    signing = {
      signByDefault = true;
    };
    delta = {
      enable = true;
    };
    lfs = {
      enable = true;
    };
    includes = [
      {
        condition = "gitdir:~/Project/Personal/";
        contents = {
          commit.gpgsign = true;
          user.email = "maguetamarcos@gmail.com";
        };
      }
      {
        condition = "gitdir:~/Project/Work/";
        contents = {
          commit.gpgsign = true;
          user.email = "marcosmagueta@datarisk.io";
        };
      }
    ];
      
  };
}
