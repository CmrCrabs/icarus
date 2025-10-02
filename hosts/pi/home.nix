{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./../../modules/dev
    ./../../modules/desktop
  ];
  
  config.ghostty.enable = false;
  config.langtools.enable = false;
  config.aerospace.enable = false;

  home.username = "zayaanazam";
  home.stateVersion = "25.11";
      
  home.sessionVariables = {
    EDITOR = "vim";
    SHELL = "fish";
  };
}
