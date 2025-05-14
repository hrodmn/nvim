---@type ChadrcConfig
local M = {}

-- M.ui = {
--   statusline = {
--     theme = "default",
--     separator_style = "default",
--     order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "gh_notifications" },
--     modules = {
--       gh_notifications = function()
--         local data = require("github-notifications").statusline_notifications()
--         return data.icon .. " " .. tostring(data.count)
--       end,
--
--       f = "%F",
--     },
--   },
-- }
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
