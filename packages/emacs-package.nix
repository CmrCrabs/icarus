{ pkgs, self, ... }:

let
  deps = with pkgs; [
    ripgrep
    git
  ];

  emacsWrapper = pkgs.writeShellScriptBin "emacs" ''
    emacsdir="$HOME/.emacs.d"
    doomdir="$HOME/.doom.d"

    if [[ ! -d "$emacsdir" ]]; then
      echo "bootstrapping .emacs.d"
      git clone https://github.com/hlissner/doom-emacs "$emacsdir"
      git clone https://github.com/cmrcrabs/.doom.d "$doomdir"
      echo "syncing doom"
      ~/.emacs.d/bin/doom sync
      ~/.emacs.d/bin/doom env
      echo "..done"
    fi

    exec ${pkgs.emacs}/bin/emacs "$@"
  '';
in

pkgs.buildEnv {
  name = "emacs";
  paths = deps ++ [ emacsWrapper ];
}
