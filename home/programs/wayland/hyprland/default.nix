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
      "systemctl --user start "
      "clipse -listen"
      "hyprpaper"
      "waybar"
    ];

    windowrule = [
      "float, class:nemo"
      "float, class:org.pulseaudio.pavucontrol"
      "float, class:org.gnome.Calculator"

      # clipse
      "float, class:(clipse)"
      "size 622 652, class:(clipse)"
      "stayfocused, class:(clipse)"
    ];

    env = [
      # nvidia
      "LIBVA_DRIVER_NAME, nvidia"
      "__GLX_VENDOR_LIBRARY_NAME, nvidia"
      "NVD_BACKEND, direct"

      # electron apps
      "ELECTRON_OZONE_PLATFORM_HINT, auto"

      # cursor
      "HYPRCURSOR_THEME,Qogir"
      "HYPRCURSOR_SIZE,24"
      "XCURSOR_THEME,Qogir"
      "XCURSOR_SIZE,24"
    ];
  };
}
