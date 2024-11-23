local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
    tsx = { "prettier" },
    typescriptreact = { "prettier" },
    markdown = { "markdownlint-cli2" },
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
    rust = { "rustfmt" },
    terraform = { "terraform-fmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
    async = false,
  },
}

require("conform").setup(options)
