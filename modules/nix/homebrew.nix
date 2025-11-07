{ inputs, ... }:
{
  nix-homebrew = {
    enable = true;
    user = "zayaanazam";
    
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "d12frosted/homebrew-emacs-plus" = inputs.emacs-plus;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    taps = [
      "d12frosted/emacs-plus"
    ];
    brews = [
      # "emacs-plus"
    ];
    casks = [
      "discord"
      "flux-app"
      "AlDente"
      "Spotify"
      "music-presence"
      "protonvpn"
      "caffeine"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
      upgrade = false;
    };
  };
}
