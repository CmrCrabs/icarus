{ pkgs, self, ... }:

let
  deps = with pkgs; [
    # tmux
  ];

  tempDir = pkgs.runCommand "iniFolder" {} ''
    mkdir -p $out
    cp -r ${../modules/dev/tmux} $out/tmux
  '';
  
  tmuxWrapper = pkgs.writeShellScriptBin "tmux" ''
    exec ${pkgs.tmux}/bin/tmux -f ${tempDir}/tmux/tmux.conf "$@"
  '';
in

pkgs.buildEnv {
  name = "tmux";
  paths = deps ++ [ tmuxWrapper ];
}
