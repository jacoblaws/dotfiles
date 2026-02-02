{
  imports = [ ./keybinds.nix ./settings.nix ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [ "noctalia-shell" ];

      windowrule = [
        "float on, match:class nemo"
        "float on, match:class org.pulseaudio.pavucontrol"
        "float on, match:class org.gnome.Calculator"
      ];

      env = [
        "QT_QPA_PLATFORMTHEME, gtk"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"

        # nvidia
        "LIBVA_DRIVER_NAME, nvidia"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "NVD_BACKEND, direct"
      ];
    };
  };
}
