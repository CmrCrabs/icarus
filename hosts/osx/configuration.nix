{
 inputs,
 pkgs,
 ...
}:
{
  imports = [
    ./../../modules/system
  ];


  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;

  security.pam.services.sudo_local.touchIdAuth = true;
}
