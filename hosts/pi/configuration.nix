{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking = {
    hostName = "zayaanazam";
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  services.libinput.enable = true;
  console.keyMap = "uk";


  users.users.zayaanazam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    packages = with pkgs; [ ];
  };

  virtualisation.docker = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  services.dbus.enable = true;

  system.stateVersion = "25.11";
}

