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
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}

lspconfig.ruff.setup {
  trace = "messages",
  init_options = {
    settings = {
      logLevel = "debug",
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "python" },
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "terraform" },
}

--Enable (broadcasting) snippet capability for completion
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup { capabilities = capabilities }
lspconfig.ts_ls.setup {}
lspconfig.rust_analyzer.setup { capabilities = capabilities }
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.sqlls.setup {}
-- lspconfig.postgres_lsp.setup {}
