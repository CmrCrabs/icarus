{ config, lib, pkgs, ... }:
{
  imports = [
    ./ghostty
    ./git
    ./nvim
    ./fish
    ./starship
  ];

  config.ghostty.enable = lib.mkDefault true;
  config.git.enable = lib.mkDefault true;
  config.nvim.enable = lib.mkDefault true;
  config.fish.enable = lib.mkDefault true;
  config.starship.enable = lib.mkDefault true;
}

