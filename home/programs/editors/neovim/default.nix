{ inputs, config, pkgs, ... }:

let
  homeDirectory = "${config.home.homeDirectory}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    extraPackages = with pkgs; [
      nil
      wget
      curl
      unzip
      clang
      tree-sitter
      clang-tools
      rust-analyzer
      cmake-language-server
      lua-language-server
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = mkOutOfStoreSymlink "${homeDirectory}/dotfiles/home/programs/editors/neovim";
  };
}
