{
 lib,
 config,
 pkgs,
 ...
}: let
  email = "zf.azam@proton.me";
  name = "CmrCrabs";
in {

  options.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.git.enable {
    home.packages = [
      pkgs.gh
    ];
    programs.git = {
      enable = true;
      userEmail = email;
      userName = name;
      extraConfig = {
        color.ui = "true";
        core.editor = "nvim";
        init.defaultBranch = "main";
      };
    };
  };
}
