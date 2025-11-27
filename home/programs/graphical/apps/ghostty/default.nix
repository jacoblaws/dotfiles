{
  imports = [ ./themes.nix ];
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      font-size = 14;
      font-family = [ "Recursive Mono Casual Static" "Symbols Nerd Font" ];
      font-feature =
        [ "dlig" "ss01" "ss02" "ss04" "ss05" "ss06" "ss07" "ss08" "ss12" ];
      theme = "current";
      window-padding-balance = true;
      window-padding-color = "extend";
    };
  };
}
