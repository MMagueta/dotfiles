{ pkgs, ... }:
let
  overlays = import ./overlays.nix;
in
{
  manual.manpages.enable = true;

  nixpkgs.overlays = [ overlays ];

  home.packages = with pkgs; [
    git-crypt
    taskjuggler
    dotnet-sdk_5
    curl
    wget
    gcc
    ccls
    python38
    python38Packages.python-language-server
    unzip
    gnupg
    sbcl
    ccl
    openjdk11
    leiningen
    plantuml
    graphviz
    ocaml
    opam
    ocamlPackages.ocaml-lsp
    ocamlPackages.utop
    racket-minimal
    rnix-lsp
    neofetch
    texlive.combined.scheme-full
    lispPackages.quicklisp
    lfe
    hy
    elixir
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


  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      background_opacity = 1;

      window = {
        dynamic_title = true;
        dynamic_padding = true;
        decorations = "full";
        dimensions = { lines = 0; columns = 0; };
        padding = { x = 1; y = 1; };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      mouse = { hide_when_typing = false; };

      font = let
        fontname = "DejaVu Sans Mono";
      in
        {
          #font = let fontname = "Recursive Mono Linear Static"; in { # TODO fix this font with nerd font
          normal = { family = fontname; style = "Semibold"; };
          bold = { family = fontname; style = "Bold"; };
          italic = { family = fontname; style = "Semibold Italic"; };
          size = 14;
        };
      cursor.style = "Block";

      colors = {
        primary = {
          background = "0x24283b";
          foreground = "0xc0caf5";
        };
        normal = {
          black = "0x1D202F";
          red = "0xf7768e";
          green = "0x9ece6a";
          yellow = "0xe0af68";
          blue = "0x7aa2f7";
          magenta = "0xbb9af7";
          cyan = "0x7dcfff";
          white = "0xa9b1d6";
        };
        bright = {
          black = "0x414868";
          red = "0xf7768e";
          green = "0x9ece6a";
          yellow = "0xe0af68";
          blue = "0x7aa2f7";
          magenta = "0xbb9af7";
          cyan = "0x7dcfff";
          white = "0xc0caf5";
        };
        indexed_colors = [
          { index = 16; color = "0xff9e64"; }
          { index = 17; color = "0xdb4b4b"; }
        ];
      };
    };
  };
}
