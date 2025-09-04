{ pkgs, ... }:
let
  customIosevka = pkgs.iosevka.override {
    set = "Icarus";
    privateBuildPlan = builtins.readFile ../../packages/private-build-plans.toml;
  };

in {
  fonts = {
    packages = [
      customIosevka
      pkgs.nerd-fonts.symbols-only
    ];
  };
}
