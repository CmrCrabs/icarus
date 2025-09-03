
{
 lib,
 config,
 pkgs,
 ...
}:
{
  options.aerospace.enable = lib.mkEnableOption "enables aerospace";

  config = lib.mkIf config.git.enable {
    programs.aerospace = {
      enable = true;
      userSettings = {
        start-at-login = true;

        # after-startup-command = [
        #   "exec-and-forget open -a Flux"
        #   "exec-and-forget open -a AlDente"
        # ];

        mode.main.binding = {
          alt-h = "focus left";
          alt-l = "focus right";
          alt-k = "focus up";
          alt-j = "focus down";
          alt-tab = "focus dfs-next --boundaries-action wrap-around-the-workspace";
          alt-shift-tab = "focus dfs-prev --boundaries-action wrap-around-the-workspace";
          shift-alt-h = "move left";
          shift-alt-l = "move right";
          shift-alt-k = "move up";
          shift-alt-j = "move down";


          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";
          alt-8 = "workspace 8";
          alt-9 = "workspace 9";
          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";
          alt-shift-7 = "move-node-to-workspace 7";
          alt-shift-8 = "move-node-to-workspace 8";
          alt-shift-9 = "move-node-to-workspace 9";

          alt-f = "layout floating tiling";
          alt-a = "layout tiles accordion";
          alt-b = "layout horizontal vertical";
          alt-m = "macos-native-fullscreen";

          alt-shift-s = "exec-and-forget screencapture -i -c";
        };

        gaps = {
          inner.horizontal = 40;
          inner.vertical = 40;
          outer.left = 40;
          outer.top = 40;
          outer.bottom = 40;
          outer.right = 40;
        };
        on-window-detected = [
          {
            "if".app-id = "org.mozilla.firefox";
            run = "move-node-to-workspace 1";
          }
          {
            "if".app-id = "com.mitchellh.ghostty";
            run = "move-node-to-workspace 2";
          }
          {
            "if".app-id = "md.obsidian";
            run = "move-node-to-workspace 3";
          }
          {
            "if".app-id = "com.hnc.Discord";
            run = "move-node-to-workspace 4";
          }
          {
            "if".app-id = "com.codeweavers.CrossOver";
            run = "move-node-to-workspace 6";
          }
          {
            "if".app-id = "com.codeweavers.CrossOver";
            run = "move-node-to-workspace 6";
          }
          {
            "if".app-id = "com.valve.steam";
            run = "move-node-to-workspace 7";
          }
          {
            "if".app-id = "com.codeweavers.CrossOverHelper.4DB4563826BAD0EB2F60EE6E42D0EA4B.646ABED859EB8345CB7610A4E8B48633";
            run = "move-node-to-workspace 8";
          }
        ];
      };
    };
  };
}
