{ pkgs, self, ... }:

let
  deps = with pkgs; [
    ripgrep
    git
    fd
  ];

  configDir = pkgs.runCommand "configDir" {} ''
    mkdir -p $out
    cp -r ${../modules/editors/emacs/doom} $out/doom
  '';
 
  emacsWrapper = pkgs.writeShellScriptBin "emacs" ''
    target="$HOME/.emacs"

    if [[ ! -d "$target" ]]; then
      echo "bootstrapping config"
      mkdir -p "$target"
      cp -r ${configDir}/doom/* "$target"/
      echo "..done"
    fi

    exec ${pkgs.emacs}/bin/emacs --init-directory="$target" "$@"
  '';
in

pkgs.buildEnv {
  name = "emacs";
  paths = deps ++ [ emacsWrapper ];
}
