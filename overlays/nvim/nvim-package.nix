{ pkgs, self, nightly-neovim, ... }:

let
  tempDir = pkgs.runCommand "initFolder" {} ''
    mkdir -p $out
    cp -r ${self}/config/nvim $out/
  '';
in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = with pkgs; [
    ## lsps
    lua-language-server
    typescript-language-server
    rust-analyzer
    vimPlugins.omnisharp-extended-lsp-nvim
    nixd
    tinymist
		nightly-neovim

    ## formatters
    alejandra
    stylua
  ];
  text = ''
    nvim -u ${tempDir}/nvim/init.lua
  '';
}
