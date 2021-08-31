{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./virtualisation.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  time.timeZone = "America/Sao_Paulo";

  networking.useDHCP = false;
  networking.interfaces.enp7s0.useDHCP = false;
  networking.interfaces.wlp6s0.useDHCP = false;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.xserver.libinput.enable = true;

  virtualisation.docker.enable = true;

  users.users.mmagueta = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ git ];
  services.openssh.enable = true;
  system.stateVersion = "21.05";

}
