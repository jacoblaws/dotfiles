local mod = "SUPER"
local dsp = hl.dsp
local exec_cmd, focus, window = dsp.exec_cmd, dsp.focus, dsp.window

local bind = function(keys, f)
	hl.bind(mod .. " + " .. keys, f)
end

local bindm = function(keys, f)
	hl.bind(mod .. " + " .. keys, f, { mouse = true })
end

local bind_raw = function(keys, f)
	hl.bind(keys, f)
end

-- Applications
bind("E", exec_cmd("nemo"))
bind("B", exec_cmd("zen"))
bind("S", exec_cmd("spotify"))
bind("D", exec_cmd("discord"))
bind("O", exec_cmd("obsidian"))
bind("Return", exec_cmd("ghostty"))

-- Shell tools
bind("Space", exec_cmd("noctalia msg panel-toggle launcher"))
bind("Backslash", exec_cmd("noctalia msg panel-toggle control-center"))
bind("SHIFT + Backslash", exec_cmd("noctalia msg panel-toggle session"))
bind("SHIFT + S", exec_cmd("noctalia msg settings-open"))
bind("Escape", exec_cmd("noctalia msg session lock"))

bind_raw("XF86AudioMute", exec_cmd("noctalia msg volume-mute"))
bind_raw("XF86AudioLowerVolume", exec_cmd("noctalia msg volume-down"))
bind_raw("XF86AudioRaiseVolume", exec_cmd("noctalia msg volume-up"))
-- bind_raw("Super_L", exec_cmd("noctalia msg session lock"))

bind_raw("XF86MonBrightnessDown", exec_cmd("noctalia msg brightness-down"))
bind_raw("XF86MonBrightnessUp", exec_cmd("noctalia msg brightness-up"))

-- Move window focus with mod + [h,j,k,l]
bind("h", focus({ direction = "left" }))
bind("j", focus({ direction = "down" }))
bind("k", focus({ direction = "up" }))
bind("l", focus({ direction = "right" }))

-- Move windows with mod + SHIFT + [h,j,k,l]
bind("SHIFT + H", window.move({ direction = "left" }))
bind("SHIFT + J", window.move({ direction = "down" }))
bind("SHIFT + K", window.move({ direction = "up" }))
bind("SHIFT + L", window.move({ direction = "right" }))

-- Window management
bind("Q", window.close())
bind("V", window.float({ action = "toggle" }))
bind("F", window.fullscreen({ action = "toggle" }))
bind("SHIFT + E", dsp.exit())

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(key, focus({ workspace = i }))
	bind("SHIFT + " .. key, window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mod + scroll
bindm("mouse_down", focus({ workspace = "e+1" }))
bindm("mouse_up", focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
bindm("mouse:272", window.drag())
bindm("mouse:273", window.resize())
