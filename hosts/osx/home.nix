{ config, pkgs, ... }:
{
  imports = [
    ./../../home/git.nix
  ];
  git.enable = true;

  home.username = "zayaanazam";
  home.stateVersion = "25.05";
}
