---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "github_light" },
  hl_override = {
    ["@comment"] = {
      fg = "white",
      italic = true,
    },
  },
}

return M
