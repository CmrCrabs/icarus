{ pkgs, ... }:
{
  home.packages = [
    (import ./colors.nix {inherit pkgs;})
    (import ./crossover.nix {inherit pkgs;})
  ];
}
