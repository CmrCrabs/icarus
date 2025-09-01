{ config, ... }:
{
  imports = [
    ./nvim.nix
    ./ghostty.nix
  ];
  config.nvim.enable = true;
  config.ghostty.enable = true;
}

