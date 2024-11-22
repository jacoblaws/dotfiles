{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extensions = [
      "everforest"
      "nix"
      "lua"
    ];

    userSettings = {
      vim_mode = true;
      load_direnv = "shell_hook";

      ui_font_size = 16;
      buffer_font_size = 16;
      buffer_font_family = "JetBrains Mono";
      buffer_font_fallbacks = [ "Symbols Nerd Font" ];

      theme = {
        "mode" = "dark";
        "dark" = "Everforest Dark";
        "light" = "Everforest Dark";
      };

      telemetry = {
        metrics = false;
        diagnostics = false;
      };

      languages.Nix.language_servers = [ "nil" "!nixd" ];
    };
  };
}
