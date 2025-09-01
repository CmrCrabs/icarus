{ config, lib, ... }:
{
  imports = [
    ./ghostty
    ./git
    ./nvim
  ];
  config.ghostty.enable = lib.mkDefault true;
  config.git.enable = lib.mkDefault true;
  config.nvim.enable = lib.mkDefault true;
}

