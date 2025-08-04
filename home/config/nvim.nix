{
  config,
  lib,
  pkgs,
  dotfilesDir,
  ...
}: {
  home.packages = with pkgs; [
    ## lsps
    lua-language-server
    typescript-language-server
    rust-analyzer
    vimPlugins.omnisharp-extended-lsp-nvim
    nixd
    # tinymist

    ## formatters
    alejandra
  ];

  xdg.configFile = {
    nvim = {
      source =
        config.lib.file.mkOutOfStoreSymlink
        "${dotfilesDir}/nvim";
      recursive = true;
    };
  };
}
