{ pkgs, lib, config, ... }:
{
  options.ghostty.enable = lib.mkEnableOption "enables ghostty";

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;
      package = (if pkgs.stdenv.hostPlatform.isDarwin
        then pkgs.ghostty-bin
        else pkgs.ghostty);

      settings = {
        font-family = [
          "Iosevka-Icarus"
          "Symbols Nerd Font"
        ]; 
        command = "${pkgs.fish}/bin/fish";
        shell-integration = "fish";
        window-title-font-family = "Iosevka-Icarus";
        theme = "Kanagawa Dragon";
        custom-shader = "${./crt.glsl}";
        font-size = 15;
        mouse-hide-while-typing = true;
        title = " ";
        window-padding-balance = true;
        window-padding-x = 20; 
        window-padding-y = 2;
        window-padding-color = "background";
        # focus-follows-mouse = true;
        macos-titlebar-proxy-icon = "hidden";
        # macos-titlebar-style = "hidden"; enable when aerospace
        macos-icon = "retro";
        window-colorspace = "display-p3";
        auto-update = "off";
        bold-is-bright = true;

        # switch to custom icon https://github.com/ghostty-org/ghostty/pull/8230
      };
    };
  };
}
