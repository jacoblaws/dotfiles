{ system, inputs, pkgs, ... }: let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    extensions = with extensions; [
      open-vsx.sainnhe.everforest
      open-vsx.asvetliakov.vscode-neovim

      # rust support
      open-vsx.rust-lang.rust-analyzer

      # python support
      open-vsx.ms-python.python
      open-vsx.ms-python.debugpy
      open-vsx.detachhead.basedpyright

      # nix & direnv support
      open-vsx.jnoortheen.nix-ide
      open-vsx.mkhl.direnv
      open-vsx.arrterian.nix-env-selector
    ];

    userSettings = {
      "window.menuBarVisibility" = "toggle";
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Everforest Dark";
      "editor.fontSize" = 16;
      "editor.fontFamily" = "'JetBrainsMono', 'SymbolsNerdFontMono'";
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "nix.enableLanguageServer" = true;
    };
  };
}
