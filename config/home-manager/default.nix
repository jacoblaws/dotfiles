{ config, ... }:

{
  imports = [
    ./fish.nix
    ./neovim.nix
    ./packages.nix
  ];

  programs = {
    kitty.enable = true;
    tmux.enable = true;
  };

  xdg.configFile = {
    hypr.source = ../hypr;
    kitty.source = ../kitty;
    tmux.source = ../tmux;
  };

  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/desktop";
    documents = "${config.home.homeDirectory}/docs";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/media/audio/music";
    pictures = "${config.home.homeDirectory}/media/images";
    publicShare = "${config.home.homeDirectory}/public";
    templates = "${config.home.homeDirectory}/templates";
    videos = "${config.home.homeDirectory}/media/videos";
  };
}
