
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

--Hyprland specific
config.enable_wayland = false

-- Fonts:
config.font = wezterm.font('HackNerdFont', {weight = 'Bold'})
config.font_size = 11.6


-- Color scheme / looks
config.color_scheme = 'Fairy Floss (Gogh)'
config.enable_tab_bar = false
config.window_padding = { left = "0cell", right = "0cell" , top = "0cell", bottom = "0cell", }
-- Other config options
config.default_prog = { '/bin/fish' }

-- Key binds
config.disable_default_key_bindings = true
config.keys = {
-- Clipboard
{ key = 'C', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection', },
{ key = 'V', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard', },
-- Pane switches
{ key = '1', mods = 'ALT', action = wezterm.action.ActivatePaneByIndex(0) },
{ key = '2', mods = 'ALT', action = wezterm.action.ActivatePaneByIndex(1) },
{ key = '3', mods = 'ALT', action = wezterm.action.ActivatePaneByIndex(2) },
{ key = 'q', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true }, },
{ key = 'a', mods = 'ALT', action = wezterm.action.SplitPane { direction = 'Right' }, },
}
-- Turn off opacity and padding for Neovim
wezterm.on("update-right-status", function(window, pane)
  local process_name = pane:get_foreground_process_name() or ""

  local overrides = window:get_config_overrides() or {}

  if process_name:match("nvim") then
    overrides.window_background_opacity = 1.0 -- Adjust opacity for Neovim
    overrides.window_padding = { left = "0cell", right = "0cell" , top = "0cell", bottom = "0cell", }
  
  elseif process_name:match("bluetuith") then
    -- Semi-transparent look for Bluetuith
    overrides.window_background_opacity = 0.82
  else
-- Turn down opacity for bluetuthi 
	  overrides.window_background_opacity = 0.45 -- Default opacity for other apps
    overrides.window_padding = { left = "0.5cell", right = "0cell" , top = "0.5cell", bottom = "0cell", }

  end

  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config

