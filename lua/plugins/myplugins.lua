local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
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
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "vim-test/vim-test",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint",
        "typescript-language-server",
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
  {
    "robitx/gp.nvim",
    lazy = false,
    config = function()
      local conf = {
        providers = {
          openai = {
            disable = false,
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv "OPENAI_API_KEY",
          },
          anthropic = {
            disable = false,
            endpoint = "https://api.anthropic.com/v1/messages",
            secret = os.getenv "ANTHROPIC_API_KEY",
          },
        },
        agents = {
          {
            provider = "anthropic",
            name = "ChatClaude-3-5-Sonnet",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "claude-3-5-sonnet-20241022", temperature = 0.8, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
        },
      }
      require("gp").setup(conf)

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
  {
    "dense-analysis/ale",
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 1

      g.ale_linters = {
        Dockerfile = { "hadolint" },
      }

      vim.cmd [[
     " Make sure ale is loaded
     au BufRead,BufNewFile Dockerfile setlocal filetype=dockerfile

     let g:ale_enabled = 0  " Disable ALE by default

     " Enable ALE for Dockerfiles only
     autocmd FileType dockerfile let b:ale_enabled = 1

     " Specify hadolint as the linter for Dockerfile
     let g:ale_linters = {
     \   'dockerfile': ['hadolint']
     \}
   ]]
    end,
    lazy = false,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /home/henry/vaults/**.md",
      "BufNewFile /home/henry/vaults/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    config = function()
      require("obsidian").setup {
        workspaces = {
          {
            name = "vault",
            path = "~/vaults",
          },
        },
      }
    end,
    init = function()
      vim.opt_local.conceallevel = 1
    end,
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },
  { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
    -- for complete functionality (language features)
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dev = false,
    opts = {},
    dependencies = {
      -- for language features in code cells
      -- configured in lua/plugins/lsp.lua and
      -- added as a nvim-cmp source in lua/plugins/completion.lua
      "jmbuhr/otter.nvim",
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup {}
    end,
    lazy = false,
  },
}
return plugins
