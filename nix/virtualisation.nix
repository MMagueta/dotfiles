{ config, lib, modulesPath, pkgs, options, specialArgs }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      dates = "weekly";
      enable = true;
      flags = [ "--all" ];
    };
  };

  environment.systemPackages = (
    with pkgs; [
      docker_compose
      qemu
      qemu-utils
    ]
  );
}