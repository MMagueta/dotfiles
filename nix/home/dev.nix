{ pkgs, ... }:

{
  manual.manpages.enable = true;

  home.packages = with pkgs; [
    git-crypt
    taskjuggler
    dotnet-sdk_5
    curl
    wget
    python3
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
    #texlive.combined.scheme-full
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
  
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ../../shell/profile;
  };
  
  programs.gpg.enable = true;
  
  home.file = {
   ".gnupg/sshcontrol" = {
     source = ../../gpg/sshcontrol;
   };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000;
    defaultCacheTtlSsh = 34560000;
    maxCacheTtl = 34560000;
    maxCacheTtlSsh = 34560000;
  };

}
