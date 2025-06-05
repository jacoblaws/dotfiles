{
  services.darkman = {
    enable = true;
    settings = {
      usegeoclue = false;
      dbusserver = true;
      portal = true;
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
    };
  };
  services.hyprpolkitagent.enable = true;
  services.swaync.enable = true;
}
