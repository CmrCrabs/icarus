{inputs, pkgs, lib, config, ... }:
{
  options.emacs.enable = lib.mkEnableOption "enables emacs";

  config = lib.mkIf config.emacs.enable {
    home.packages = [
      inputs.self.packages.${pkgs.system}.emacs
    ];
  };
}

