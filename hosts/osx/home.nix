{
  imports = [
    ./../../modules/dev
    ./../../modules/editors
    ./../../modules/desktop

    ./../../scripts
  ];

  home.username = "zayaanazam";
  home.stateVersion = "25.05";
      
  home.sessionVariables = {
    EDITOR = "emacs";
    SHELL = "fish";
    TERMINAL = "ghostty";
    BROWSER = "firefox";
  };
}
