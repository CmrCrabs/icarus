{inputs, pkgs, lib, config, ... }:
{
  options.langtools.enable = lib.mkEnableOption "enables languages";

  config = lib.mkIf config.langtools.enable {
    home.packages = with pkgs; [
      # c
      cmake
      gnumake
      ninja

      # general
      zlib

      # haskell
      ghc
      cabal-install
      ormolu

      # rust
      rustup
      spirv-tools

      # java
      jdk25_headless
    ];
  };
}

