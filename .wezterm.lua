-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}
config.wsl_domains = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:Ubuntu',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'Ubuntu',
  },
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Ubuntu'

local my_ayu_mirage = wezterm.color.get_builtin_schemes()['Ayu Mirage']
my_ayu_mirage.scrollbar_thumb = '#cbccc6'

config.color_schemes = {
  ['My Ayu Mirage'] = my_ayu_mirage,
}

config.color_scheme = 'My Ayu Mirage'
config.min_scroll_bar_height = "1px"

config.window_background_opacity = 0.8

config.keys = {
  { 
    key = 'V',
    mods = 'CTRL',
    action = act.PasteFrom 'Clipboard' 
  },
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search {
      Regex = '[a-f0-9]{6,}',
    },
  },
  -- search for the lowercase string "hash" matching the case exactly
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search { CaseSensitiveString = 'hash' },
  },
  -- search for the string "hash" matching regardless of case
  {
    key = 'H',
    mods = 'SHIFT|CTRL',
    action = act.Search { CaseInSensitiveString = 'hash' },
  },
}

config.check_for_updates = true

config.enable_scroll_bar = true

-- and finally, return the configuration to wezterm
return config
