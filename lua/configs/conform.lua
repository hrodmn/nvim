local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    typescript = { "prettier" },
    tsx = { "prettier" },
    typescriptreact = { "prettier" },
    markdown = { "markdownlint-cli2" },
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
    quarto = { "injected" },
    rust = { "rustfmt" },
    terraform = { "terraform-fmt" },
    r = { "styler" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
    async = false,
  },
}

require("conform").setup(options)

-- Customize the "injected" formatter
require("conform").formatters.injected = {
  -- Set the options field
  options = {
    -- Set to true to ignore errors
    ignore_errors = false,
    -- Map of treesitter language to file extension
    -- A temporary file name with this extension will be generated during formatting
    -- because some formatters care about the filename.
    lang_to_ext = {
      bash = "sh",
      c_sharp = "cs",
      elixir = "exs",
      javascript = "js",
      julia = "jl",
      latex = "tex",
      markdown = "md",
      python = "py",
      ruby = "rb",
      rust = "rs",
      teal = "tl",
      r = "r",
      typescript = "ts",
    },
    -- Map of treesitter language to formatters to use
    -- (defaults to the value from formatters_by_ft)
    lang_to_formatters = {},
  },
}
