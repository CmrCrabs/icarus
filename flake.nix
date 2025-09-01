{
  description = "to fall is to have once soared";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            inputs.neovim-nightly.overlays.default
          ];
        };
        nightly-neovim = inputs.neovim-nightly.packages.${system}.default;

        mkNvim = import ./overlays/nvim-package.nix {inherit pkgs self nightly-neovim;};
      in {
        packages.nvim = mkNvim;
      }
    )
    // {
      darwinConfigurations."osx" = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ ./hosts/osx/configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };
}
