{ pkgs, self, nightly-neovim, ... }:

let
  deps = with pkgs; [
    ## lsps
    lua-language-server
    typescript-language-server
    rust-analyzer
    vimPlugins.omnisharp-extended-lsp-nvim
    nixd
    tinymist

    ## formatters
    alejandra
    stylua
  ];

  tempDir = pkgs.runCommand "iniFolder" {} ''
    mkdir -p $out
    cp -r ${../config/nvim} $out/nvim
  '';
  
  nvimWrapper = pkgs.writeShellScriptBin "nvim" ''
    exec ${nightly-neovim}/bin/nvim -u ${tempDir}/nvim/init.lua "$@"
  '';
in

pkgs.buildEnv {
  name = "nvim";
  paths = deps ++ [ nvimWrapper ];
}
