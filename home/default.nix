{ user, ... }:
let
  homeDir = "/home/${user}";
in
{
  imports = [
    ./apps
    ./editors
    ./terminal
    ./wayland
    ./services.nix
  ];

  home = {
    username = user;
    homeDirectory = homeDir;
    stateVersion = "26.05";
  };

  xdg.userDirs = {
    enable = true;
    desktop = "${homeDir}/desktop";
    documents = "${homeDir}/docs";
    download = "${homeDir}/downloads";
    music = "${homeDir}/media/audio/music";
    pictures = "${homeDir}/media/images";
    publicShare = "${homeDir}/public";
    templates = "${homeDir}/templates";
    videos = "${homeDir}/media/videos";
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [
        "zathura.desktop"
        "sioyek.desktop"
      ];
      "default-web-browser" = [ "zen-beta.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unkown" = [ "zen-beta.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [
        "zathura.desktop"
        "sioyek.desktop"
      ];
      "default-web-browser" = [ "zen-beta.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unkown" = [ "zen-beta.desktop" ];
    };
  };
}
