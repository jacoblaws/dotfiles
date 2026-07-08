-- Startup applications
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
end)

hl.config({
	general = {
		layout = "dwindle",
		no_focus_fallback = false,

		-- Borders
		border_size = 0,
		resize_on_border = true,
		hover_icon_on_border = false,
		extend_border_grab_area = 15,

		-- Gaps
		gaps_in = 5,
		gaps_out = 10,
	},

	decoration = {
		rounding = 14,

		-- Window opacity
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,

		-- Inactive window dimming
		dim_inactive = false,
		dim_strength = 0.2,
		dim_special = 0.2,
		dim_around = 0.4,

		blur = {
			enabled = false,
		},

		shadow = {
			enabled = true,
			range = 10,
		},
	},

	animations = {
		enabled = true,
	},

	input = {
		sensitivity = 0.0,
		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
		},
	},

	cursor = {
		no_hardware_cursors = true,
		no_break_fs_vrr = true,
		enable_hyprcursor = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		vrr = 2,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.monitor({ output = "DP-3", mode = "3440x1440@144", position = "0x0", scale = 1, bitdepth = 10, vrr = 2 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default", style = "slide" })

hl.window_rule({ match = { class = "nemo" }, float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })

-- Environment variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
