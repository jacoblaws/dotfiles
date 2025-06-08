{ inputs, config, pkgs, ... }: let
  inherit (config.home) homeDirectory;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    extraPackages = with pkgs; [
      basedpyright
      bash-language-server
      clang-tools
      curl
      fzf
      gopls
      lua-language-server
      nixd
      rust-analyzer
      tree-sitter
      unzip
      wget
    ];
  };

  xdg.configFile.nvim = {
    source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/editors/neovim";
  };
}
