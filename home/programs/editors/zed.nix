{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extraPackages = with pkgs; [
      nil
      rust-analyzer
      libgcc
    ];

    extensions = [
      "everforest"
      "nix"
      "lua"
      "toml"
    ];

    userSettings = {
      # for vim mode
      vim_mode = true;
      cursor_blink = false;
      relative_line_numbers = true;
      scrollbar.show = "never";
      scroll_beyond_last_line = "off";
      vertical_scroll_margin = 0;

      # direnv integration
      load_direnv = "shell_hook";

      # editor font settings
      buffer_font_size = 19;
      buffer_font_family = "Rec Mono Casual";
      buffer_font_fallbacks = [ "Symbols Nerd Font" ];

      # ui font settings
      ui_font_size = 18;
      ui_font_family = "Recursive Sans Linear Static";
      ui_font_fallback = [ "Symbols Nerd Font" ];

      # tab line
      file_icons = true;
      git_status = true;

      theme = {
        "mode" = "dark";
        "dark" = "Everforest Dark";
        "light" = "Everforest Dark";
      };

      telemetry = {
        metrics = false;
        diagnostics = false;
      };

      # handle desired lsps with Nix
      lsp = {
        nix.binary.path_lookup = true;
        rust-analyzer = {
          binary.path_lookup = true;
          initialization_options = {
            cargo.features = "all";
          };
        };
      };

      languages.Nix.language_servers = [ "nil" "!nixd" ];
    };

    userKeymaps = {
    };
  };
}
