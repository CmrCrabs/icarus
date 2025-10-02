{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./../../modules/dev
    ./../../modules/desktop
  ];
  
  ghostty.enable = false;
  langtools.enable = false;
  aerospace.enable = false;

  home.username = "zayaanazam";
  home.stateVersion = "25.11";
      
  home.sessionVariables = {
    EDITOR = "vim";
    SHELL = "fish";
  };
}
