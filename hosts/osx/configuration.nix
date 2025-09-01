{
 ...
}:
{
  imports = [
    ./../../modules/system
  ];

  users.users.zayaanazam = {
    home = "/Users/zayaanazam/";
    name = "zayaanazam";
  };

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;

  security.pam.services.sudo_local.touchIdAuth = true;
}
