{ pkgs, lib, config, ... }:
let 
  abbr = {
    "ll" = "eza -l --icons --no-permissions --no-user --no-time --group-directories-first";
    "lt" = "eza -l --icons -T --no-permissions --no-user --no-time --group-directories-first --no-filesize";
    "la" = "eza -la --icons --no-permissions --no-user --no-time --group-directories-first";
    "yz" = "yazi";
    "cl" = "clear";
    "cls" = "clear && ls";
    "wft" = "ping gnu.org -c 1";
    "nv" = "nvim";
    "cpng" = "mogrify -format png *.jpg && rm *.jpg";
    "shell" = "nix-shell . --command \"fish\"";
  };
  aliases = {
    "ls" = "eza --icons --no-permissions --no-user --no-time --group-directories-first";
    "bat" = "cat /sys/class/power_supply/BAT0/capacity";
  };
in {
  options.fish.enable = lib.mkEnableOption "enables fish";

  config = lib.mkIf config.fish.enable {
    home.packages = [
      pkgs.eza
      pkgs.fastfetch
    ];

    programs.fish = {
      enable = true;
      shellAbbrs = abbr;
      shellAliases = aliases;
      interactiveShellInit = ''
        starship init fish | source
      '';
      shellInit = ''
        /opt/homebrew/bin/brew shellenv | source
        set -g fish_greeting
        colors
      '';
    };
  };
}
