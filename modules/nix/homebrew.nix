{ inputs, ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "zayaanazam";
    
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    casks = [
      "discord"
      "flux-app"
      "AlDente"
      "Spotify"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap"; # Uninstall packages/casks not in Brewfile
      upgrade = false;
    };
  };
}
