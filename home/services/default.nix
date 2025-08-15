{
  services.darkman = {
    enable = true;
    settings = {
      usegeoclue = false;
      dbusserver = true;
      portal = true;
    };
  };

  services.fluidsynth = {
    enable = true;
    soundService = "pipewire-pulse";
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
    };
  };

  services.hyprsunset.enable = true;
  services.hyprpolkitagent.enable = true;
  services.swaync.enable = true;
}
