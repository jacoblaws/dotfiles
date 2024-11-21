{ inputs, pkgs, config, username, ... }:

{
  imports = [
    ./packages.nix
    ./cursor.nix
    ./programs/terminal
    ./programs/editors/neovim
    ./programs/editors/vscodium.nix
    inputs.ags.homeManagerModules.default
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
    tmux.enable = true;
    waybar.enable = true;
    home-manager.enable = true;
    zathura.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    ags = {
      enable = true;
      configDir = ../config/ags;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };

  xdg.configFile = {
    hypr.source = ../config/hypr;
    tmux.source = ../config/tmux;
    waybar.source = ../config/waybar;
    zathura.source = ../config/zathura;
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
