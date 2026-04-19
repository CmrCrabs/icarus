{ inputs, config, ... }:
{
  # homebrew installation
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

  # homebrew
  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    brews = [
      "mole"
      "emacs-plus@31"
      "libvterm"
      "libtool"
    ];
    casks = [
      "kicad"
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
