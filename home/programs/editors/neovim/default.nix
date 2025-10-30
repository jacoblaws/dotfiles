{ config, inputs, pkgs, ... }:
let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  neovim-nightly = inputs.neovim-nightly-overlay;
in {
  programs.neovim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Dependencies
      tree-sitter

      # Language servers
      bash-language-server
      clang-tools
      haskell-language-server
      lua-language-server
      marksman
      nixd
      nodePackages.purescript-language-server
      nushell
      rust-analyzer
      taplo
      texlab
      tinymist
      ty
      typescript-language-server
    ];
  };

  xdg.configFile.nvim.source = mkOutOfStoreSymlink
    "${homeDirectory}/dotfiles/home/programs/editors/neovim";
}
