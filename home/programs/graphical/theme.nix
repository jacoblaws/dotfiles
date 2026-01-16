{ config, pkgs, ... }: {
  home.packages = with pkgs; [ gnome-themes-extra gtk-engine-murrine nwg-look ];

  gtk = {
    enable = true;

    font = {
      name = "Recursive Sans Casual Static";
      package = pkgs.recursive;
    };

    theme = {
      name = "Everforest-Dark-BL";
      package = pkgs.everforest-gtk-theme;
    };

    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig.settings = ''
      gtk-application-prefer-dark-theme=1
    '';

    gtk4.extraConfig.settings = ''
      gtk-application-prefer-dark-theme=1
      gtk-cursor-theme-name=Qogir
    '';
  };

  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

}
