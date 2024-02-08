{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    package = pkgs.neovim-nightly;

    extraPackages = with pkgs; [
      wget
      curl
      unzip
      tree-sitter
      lua-language-server
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
    ];
  };

  xdg.configFile.nvim.source = ../nvim;
}
