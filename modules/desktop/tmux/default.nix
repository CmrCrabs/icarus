{inputs, pkgs, lib, config, ... }:
{
  options.tmux.enable = lib.mkEnableOption "enables tmux";

  config = lib.mkIf config.tmux.enable {
    home.packages = [
      inputs.self.packages.${pkgs.system}.tmux
    ];
  };
}

