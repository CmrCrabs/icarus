{
  description = "to fall is to have once soared";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    emacs-plus = {
      url = "github:d12frosted/homebrew-emacs-plus";
      flake = false;
    };
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
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

      mkNvim = import ./packages/nvim-package.nix {inherit pkgs self nightly-neovim;};
      mkEmacs = import ./packages/emacs-package.nix {inherit pkgs self;};
      mkTmux = import ./packages/tmux-package.nix {inherit pkgs self;};
    in {
      packages.nvim = mkNvim;
      packages.tmux = mkTmux;
      packages.emacs = mkEmacs;
    }
  )
  // {
    darwinConfigurations."osx" = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./hosts/osx/configuration.nix
        inputs.mac-app-util.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        # {
        #   nixpkgs.overlays = [ inputs.darwin-emacs.overlays.emacs ];
        # }
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.zayaanazam = import ./hosts/osx/home.nix;
            sharedModules = [
              inputs.mac-app-util.homeManagerModules.default
            ];
          };
        }
        inputs.nix-homebrew.darwinModules.nix-homebrew
      ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations."pi" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/pi/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.zayaanazam = import ./hosts/pi/home.nix;
          };
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
