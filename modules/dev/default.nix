{ config, lib, pkgs, ... }:
{
  imports = [
    ./ghostty
    ./git
    ./fish
    ./starship
    ./langtools
  ];

  config.ghostty.enable = lib.mkDefault true;
  config.git.enable = lib.mkDefault true;
  config.fish.enable = lib.mkDefault true;
  config.starship.enable = lib.mkDefault true;
  config.langtools.enable = lib.mkDefault true;
}

