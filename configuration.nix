{ pkgs, lib, ... }:
{

  nix.binaryCaches = [
    "https://cache.nixos.org/"
  ];
  nix.binaryCachePublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];
  nix.trustedUsers = [
    "@admin"
  ];
  users.nix.configureBuildUsers = true;

  environment.variables = {
    DOTNET_ROOT="${pkgs.dotnet-sdk}";
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
    system = x86_64-darwin
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  programs.zsh.enable = true;

  environment.shellAliases = {
    emacs = "/Applications/Emacs.app/Contents/MacOS/Emacs-arm64-11 & disown";
    emacs-nw = "/Applications/Emacs.app/Contents/MacOS/Emacs-arm64-11 -nw";
    fsc = "${pkgs.dotnet-sdk}/bin/dotnet ${pkgs.dotnet-sdk}/sdk/6.0.100/FSharp/fsc.dll";
    fsi = "${pkgs.dotnet-sdk}/bin/dotnet ${pkgs.dotnet-sdk}/sdk/6.0.100/FSharp/fsc.dll";
  };
  
  services.nix-daemon.enable = true;
  services.nix-daemon.enableSocketListener = true;
  environment.systemPackages = with pkgs; [];

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  programs.nix-index.enable = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
}
