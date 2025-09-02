{ pkgs, ... }:
let
  customIosevka = pkgs.iosevka.override {
    set = "Icarus";
    privateBuildPlan = builtins.readFile ../../overlays/private-build-plans.toml;
  };

in {
  fonts = {
    packages = [
      customIosevka
      pkgs.nerd-fonts.symbols-only
    ];
  };
}
