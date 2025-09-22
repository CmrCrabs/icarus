{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs.haskellPackages; [
    ghc
    cabal-install
  ];
}
