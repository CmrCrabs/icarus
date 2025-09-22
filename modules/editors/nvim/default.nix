{inputs, pkgs, lib, config, ... }:
{
  options.nvim.enable = lib.mkEnableOption "enables nvim";

  config = lib.mkIf config.nvim.enable {
    home.packages = [
      inputs.self.packages.${pkgs.system}.nvim
    ];
  };
}

