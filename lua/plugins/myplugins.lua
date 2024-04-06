local plugins = { 
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  		  "vim",
        "bash",
        "css",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "sql",
        "toml",
        "vimdoc",
        "yaml",
  		},
  	},
  },
  {
    "benlubas/molten-nvim",
    lazy = false,
    build = ":UpdateRemotePlugins",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "black@22.3.0",
        "ruff-lsp",
        "debugpy",
        "mypy",
        "pyright",
        "ruff",
        "stylua",
        "prettier",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
}
return plugins
