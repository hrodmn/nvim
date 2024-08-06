require "nvchad.mappings"
local map = vim.keymap.set

-- General Mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })

-- DAP (Debug Adapter Protocol) Mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })

-- DAP Python Mappings
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "DAP Python: Test Method" })

-- Your additional mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Run !pytest with <leader>tt
map("n", "<leader>tt", "<cmd> TestSuite<CR>", { desc = "Run tests" })
-- Run current test file with <leader>tf
map("n", "<leader>tf", "<cmd> TestFile<CR>", { desc = "Run tests" })
