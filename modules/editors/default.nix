{ config, lib, pkgs, ... }:
{
  imports = [
    ./nvim
    ./emacs
  ];

  config.nvim.enable = lib.mkDefault true;
  config.emacs.enable = lib.mkDefault true;
}

