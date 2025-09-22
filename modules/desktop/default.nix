{ config, lib, pkgs, ... }:
{
  imports = [
    ./aerospace
    ./tmux
  ];

  config.tmux.enable = lib.mkDefault true;
  config.aerospace.enable = lib.mkDefault true;
}
