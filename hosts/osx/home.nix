{ config, pkgs, ... }:
{
  imports = [
    ./../../modules/dev
  ];

  home.username = "zayaanazam";
  home.stateVersion = "25.05";
}
