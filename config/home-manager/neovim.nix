{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

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
