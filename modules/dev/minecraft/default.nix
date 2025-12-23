{inputs, pkgs, lib, config, ... }:
{
  options.minecraft.enable = lib.mkEnableOption "enables minecraft";

  config = lib.mkIf config.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}

