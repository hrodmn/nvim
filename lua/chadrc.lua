---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  theme_toggle = {'catppuccin', 'github_light'},
  hl_override = {
    ["@comment"] = {
      fg = "white",
      italic = true,
    }
  }
}


return M
