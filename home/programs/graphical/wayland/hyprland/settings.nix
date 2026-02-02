{
  wayland.windowManager.hyprland.settings = {
    general = {
      # borders
      border_size = 0;               # width of window borders
      resize_on_border = true;       # enables resizing windows by dragging on borders and gap
      hover_icon_on_border = false;  # shows a cursor icon when hovering over borders (with resize_on_border enabled)
      extend_border_grab_area = 15;  # extends the area around the border where you can click and drag on

      # gaps
      gaps_in = 5;                   # gaps between windows
      gaps_out = 10;                 # gaps between windows and monitor edges

      # layout
      layout = "dwindle";            # which layout to use (dwindle or master)

      # misc.
      no_focus_fallback = false;     # enables focus fallback when moving in directions where there is no window
    };

    decoration = {
      rounding = 14;                 # rounded corners' radius (in layout px)

      # window opacity
      active_opacity = 1.0;          # opacity of active windows (0.0 - 1.0)
      inactive_opacity = 1.0;        # opacity of inactive windows (0.0 - 1.0)
      fullscreen_opacity = 1.0;      # opacity of fullscreen windows (0.0 - 1.0

      # inactive window dimming
      dim_inactive = false;          # enables dimming of inactive windows
      dim_strength = 0.2;            # strength of inactive window dimming (0.0 - 1.0)
      dim_special = 0.2;             # how much to dim the rest of the screen when a special workspace is open (0.0 - 1.0)
      dim_around = 0.4;              # how much the 'dimaround' window rule should dim by (0.0 - 1.0)

      blur = {
        enabled = false;             # enable kawase window background blur
        size = 8;                    # blur size (distance)
        passes = 1;                  # the amount of passes to perform
        ignore_opacity = false;      # make the blur layer ignore the opacity of the window
        new_optimizations = true;    # enable further optimizations to the blur
        xray = false;                # if true, floating windows will ignore tiled windows in their blur
        noise = 0.0117;              # how much noise to apply (0.0 - 1.0)
        contrast = 0.8916;           # contrast modulation for blur (0.0 - 2.0)
        brightness = 0.8172;         # brightness modulation for blur (0.0 - 2.0)
      };

      shadow = {
        enabled = true;              # enables drop shadows on windows
        range = 10;                  # shadow range ('size'), in layout px
        render_power = 3;            # in what power to render the shadow falloff (1 - 4)
        ignore_window = true;        # if true, the shadow will not be rendered behind the window itself
        offset = "0 0";              # shadow rendering offset
        scale = 1.0;                 # shadow scale
      };
    };

    animations = {
      enabled = true;                # enable animations
      animation = [
        "windows, 1, 4, default"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default, slide"
      ];
    };

    input = {
      sensitivity = 0.0;              # sets the mouse input sensitivity (-1.0 - 1.0)
      accel_profile = "flat";         # sets the cursor acceleration profile
      touchpad.natural_scroll = true; # inverts scrolling direction
    };

    cursor = {
      no_hardware_cursors = true;     # disables hardware cursors
      no_break_fs_vrr = true;         # disables scheduling new frames on cursor movement
      enable_hyprcursor = true;       # enables hyprcursor support
    };

    dwindle = {
      pseudotile = true;              # pseudotile windows retain their floating size when tiled
      preserve_split = true;          # the split will not change regardless of what happens to the container
    };

    # Use three fingers to swipe between workspaces
    gesture = "3, horizontal, workspace";

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };
  };
}
