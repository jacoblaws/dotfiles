{ config, ... }:

{
  imports = [
    ./packages.nix
  ];

  home = {
    username = "jvl";
    homeDirectory = "/home/jvl";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
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

  xdg.mimeApps = {
    enable = true;

    associations.added = {
      "application/pdf" = [ "zathura.desktop" "sioyek.desktop" ];
      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unkown" = [ "firefox.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
    };

    defaultApplications = {
      "application/pdf" = [ "zathura.desktop" "sioyek.desktop" ];
      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unkown" = [ "firefox.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
    };
  };
}
