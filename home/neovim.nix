{ inputs, pkgs, ... }:

{
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
      wget
      curl
      unzip
      tree-sitter
      clang-tools
      cmake-language-server
      lua-language-server
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
    ];
  };

  xdg.configFile.nvim.source = ../config/nvim;
}
