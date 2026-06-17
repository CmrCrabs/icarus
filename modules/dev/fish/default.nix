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
        # if type -q tmux
        #   if not test -n "$TMUX"
        #     tmux attach-session -t icrs; or tmux new-session -s icrs 
        #   end
        # end

        function vterm_printf;
            if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
                # tell tmux to pass the escape sequences through
                printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
            else if string match -q -- "screen*" "$TERM"
                # GNU screen (screen, screen-256color, screen-256color-bce)
                printf "\eP\e]%s\007\e\\" "$argv"
            else
                printf "\e]%s\e\\" "$argv"
            end
        end

        function vterm_prompt_end --on-event fish_prompt
            vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)
        end
        functions --copy fish_prompt vterm_old_fish_prompt
        function fish_prompt  # IF STARSHIP RIGHTSIDE PROMPT THEN FIX
            printf "%b" (string join "\n" (vterm_old_fish_prompt))
            vterm_prompt_end
        end

        starship init fish | source
      '';
      shellInit = ''
        set -g fish_greeting
      '';
    };
  };
}
