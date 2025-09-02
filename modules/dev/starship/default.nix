{
  lib,
  config,
  ...
}: let
  os = icon: fg: "[${icon} ](fg:${fg})";
  pad = {
    left = "";
    right = "";
  };
in {
  options.starship.enable = lib.mkEnableOption "enables starship";

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        command_timeout = 500;
        add_newline = true;
        format = builtins.concatStringsSep "" [
          "$nix_shell"
          "$os"
          "$directory"
          "$cmd_duration"
          "$status"
          "$line_break"
          "[❯](bold purple)"
          ''''${custom.space}''
        ];
        custom.space = {
          when = ''! test $env'';
          format = "  ";
        };
        continuation_prompt = "∙  ┆ ";
        line_break = {disabled = false;};
        cmd_duration = {
          min_time = 1000;
          format = "[ $duration ](fg:yellow)";
        };
        nix_shell = {
          disabled = false;
          format = "[${pad.left}](fg:white)[ ](bg:white fg:black)[${pad.right}](fg:white)   ";
        };
        directory = {
          format = " [${pad.left}](fg:bright-black)[$path](bg:bright-black fg:white)[${pad.right}](fg:bright-black)";
          truncation_length = 6;
          truncation_symbol = ".../";
        };
        os = {
          disabled = false;
          format = "$symbol";
        };
        os.symbols = {
          Arch = os "" "bright-blue";
          Debian = os "" "red";
          NixOS = os "" "blue";
          Ubuntu = os "" "bright-purple";
          Macos = os "" "red";
        };
      };
    };
  };
}
