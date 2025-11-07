{inputs, pkgs, lib, config, ... }:
{
  options.emacs.enable = lib.mkEnableOption "enables emacs";

  config = lib.mkIf config.emacs.enable {
    home.packages = [
      pkgs.emacs
    ];
  };
}

