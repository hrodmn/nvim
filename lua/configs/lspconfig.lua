local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      -- analysis = {
      --   -- Ignore all files for analysis to exclusively use Ruff for linting
      --   ignore = { "*" },
      -- },
    },
  },
}
-- lspconfig.pylyzer.setup {}

lspconfig.ruff_lsp.setup {
  init_options = {},
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "python" },
}

--Enable (broadcasting) snippet capability for completion
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup { capabilities = capabilities }

lspconfig.rust_analyzer.setup { capabilities = capabilities }
