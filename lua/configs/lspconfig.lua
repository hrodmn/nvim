local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.ruff_lsp.setup({
  init_options = {},
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = {"python"}
})

lspconfig.pyright.setup(
  { on_attach = on_attach, capabilities = capabilities, filetype = {"python"}
})

