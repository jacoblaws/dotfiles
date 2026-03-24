{ config, pkgs, ... }:
let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  imports = [ ./themes.nix ];
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      libgcc
      tree-sitter

      # Language servers
      bash-language-server
      clang-tools
      haskell-language-server
      lua-language-server
      marksman
      nil
      nixd
      nushell
      package-version-server
      rust-analyzer
      taplo
      texlab
      tinymist
      ty
      typescript-language-server
      vscode-json-languageserver

      # Formatters
      fourmolu
      ruff
      stylua
      nixfmt-classic
      shfmt
      rustfmt
      nufmt
      typstyle
    ];
  };

  xdg.configFile."zed/settings.json".source =
    mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/graphical/apps/zed/settings.json";

  xdg.configFile."zed/keymap.json".source =
    mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/graphical/apps/zed/keymap.json";
}
