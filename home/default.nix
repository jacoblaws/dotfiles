{ config, username, ... }:

{
  imports = [
    ./fish.nix
    ./neovim.nix
    ./packages.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    file = {
      ".local/share/TauonMusicBox/theme/".source = ../config/tauon;
    };
  };

  programs = {
    kitty.enable = true;
    tmux.enable = true;
    starship.enable = true;
    home-manager.enable = true;
  };

  xdg.configFile = {
    hypr.source = ../config/hypr;
    kitty.source = ../config/kitty;
    tmux.source = ../config/tmux;
    "starship.toml".source = ../config/starship.toml;
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
