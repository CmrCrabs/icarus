{ pkgs, lib, config, ... }:
{
  options.ghostty.enable = lib.mkEnableOption "enables ghostty";

  config = lib.mkIf config.ghostty.enable {
    home.packages = [
      (if pkgs.stdenv.hostPlatform.isDarwin
       then pkgs.ghostty-bin
       else pkgs.ghostty)
    ];


  };
}
