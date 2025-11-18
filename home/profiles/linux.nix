{ user, ... }:
let homeDir = "/home/${user}";
in {
  home = {
    username = user;
    homeDirectory = homeDir;
    stateVersion = "23.11";
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
      "application/pdf" = [ "zathura.desktop" "sioyek.desktop" ];
      "default-web-browser" = [ "firefox.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/unkown" = [ "firefox.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "zathura.desktop" "sioyek.desktop" ];
      "default-web-browser" = [ "firefox.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/unkown" = [ "firefox.desktop" ];
    };
  };
}
