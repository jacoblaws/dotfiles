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
  };

  xdg.configFile.nvim.source = mkOutOfStoreSymlink
    "${homeDirectory}/dotfiles/home/programs/editors/neovim";
}
