---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'everforest',
  theme_toggle = {'everforest', 'github_light'},
  hl_override = {
    ["@comment"] = {
      fg = "white",
      italic = true,
    }
  }
}


return M
