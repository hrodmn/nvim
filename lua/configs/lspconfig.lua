local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

lspconfig.pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        -- ignore = { "*" },
      },
    },
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

local servers =
  { "ruff", "terraformls", "html", "ts_ls", "rust_analyzer", "docker_compose_language_service", "dockerls", "sqlls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
