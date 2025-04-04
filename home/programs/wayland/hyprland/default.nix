{ pkgs, inputs, ... }: {
  imports = [
    ./keybinds.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprpaper"
      "waybar"
    ];

    windowrule = [
      "float, class:nemo"
      "float, class:org.pulseaudio.pavucontrol"
      "float, class:org.gnome.Calculator"
    ];

    env = [
      "XDG_SESSIONS_TYPE, wayland"
      "XDG_SESSION_DESKTOP, Hyprland"
      "XDG_CURRENT_DESKTOP, Hyprland"

      "GBM_BACKEND, nvidia"
      "LIBVA_DRIVER_NAME, nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME, nvidia"

      "XCUROSOR_SIZE, 24"
      "WLR_NO_HARDWARE_CURSORS, 1"

      "GDK_BACKEND, wayland"
      "QT_QPA_PLATFORM, wayland"
      "QT_QPA_PLATFORMTHEME, qt5ct"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
    ];
  };
}
