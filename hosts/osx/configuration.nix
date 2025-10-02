{
 config,
 lib,
 ...
}:
{
  imports = [
    ./../../modules/nix/fonts.nix
    ./../../modules/nix/homebrew.nix
  ];

  users.users.zayaanazam = {
    home = "/Users/zayaanazam/";
    name = "zayaanazam";
  };

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  # fix path issues
  programs.fish.enable = true;

  # mac settings
  system.activationScripts.extraActivation.text = ''
    pmset -a displaysleep 20     
    pmset -b displaysleep 5    
  '';
  system = {
    primaryUser = "zayaanazam";
    startup.chime = true;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.12;
        autohide-time-modifier = 0.75;
        mru-spaces = false;
        show-recents = false;
        tilesize = 24;
        orientation = "bottom";
        wvous-br-corner = 5;
      };
      finder = {
        _FXShowPosixPathInTitle = true;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
      };
      loginwindow = {
        LoginwindowText = "be delusional.";
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadThreeFingerDrag = true;
      };
      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
        ShowDayOfWeek = true;
      };
      NSGlobalDomain = {
        NSWindowShouldDragOnGesture = true;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = false;
        AppleTemperatureUnit = "Celsius";
        NSTableViewDefaultSizeMode = 1;
        KeyRepeat = 2;
      };
      CustomUserPreferences = {
        "com.apple.screensaver" = {
          loginWindowIdleTime = 60;
        };
      };
    };
  };
}
