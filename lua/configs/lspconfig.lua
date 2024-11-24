local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

local servers = {
  pyright = {
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
  },
  ruff = {},
  terraformls = {},
  html = {},
  ts_ls = {},
  rust_analyzer = {},
  docker_compose_language_service = {},
  dockerls = {},
  sqlls = {},
}

for server_name, server_config in pairs(servers) do
  lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, server_config))
end
