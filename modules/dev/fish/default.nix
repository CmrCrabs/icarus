{ pkgs, lib, config, ... }:
let 
  abbr = {
    "ll" = "eza -l --icons --no-permissions --no-user --no-time --group-directories-first";
    "lt" = "eza -l --icons -T --no-permissions --no-user --no-time --group-directories-first --no-filesize --git-ignore";
    "la" = "eza -la --icons --no-permissions --no-user --no-time --group-directories-first";
    "yz" = "yazi";
    "cl" = "clear";
    "cls" = "clear && ls";
    "wft" = "ping gnu.org -c 1";
    "nv" = "nvim";
    "cpng" = "mogrify -format png *.jpg && rm *.jpg";
    "shell" = "nix-shell --command \"fish\" .";
    "ect" = "emacsclient -s /tmp/emacs501/server -t -a \"\"";
    "ec" = "emacsclient -s /tmp/emacs501/server -c -a \"\" -F '((width . 100) (height . 50))'";
  };
  aliases = {
    "ls" = "eza --icons --no-permissions --no-user --no-time --group-directories-first";
    "bat" = "cat /sys/class/power_supply/BAT0/capacity";
  };
in {
  options.fish.enable = lib.mkEnableOption "enables fish";

  config = lib.mkIf config.fish.enable {
    home.packages = with pkgs; [
      eza
      fastfetch
      yazi
      btop
    ];

    programs.fish = {
      enable = true;
      shellAbbrs = abbr;
      shellAliases = aliases;
      interactiveShellInit = ''
        starship init fish | source
        if type -q tmux
          if not test -n "$TMUX"
            tmux attach-session -t icrs; or tmux new-session -s icrs 
          end
        end
      '';
      shellInit = ''
        set -g fish_greeting
      '';
    };
  };
}
