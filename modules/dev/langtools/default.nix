{inputs, pkgs, lib, config, ... }:
{
  options.langtools.enable = lib.mkEnableOption "enables languages";

  config = lib.mkIf config.langtools.enable {
    home.packages = with pkgs; [
      # c
      cmake
      gnumake
      ninja

      # rust
      # rustup
    ];
  };
}

