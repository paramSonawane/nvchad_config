local Plugins = {
  require "configs.mason",
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "neovim/nvim-lspconfig",
    config = function(_)
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("javascript", { "html" })
      -- require("nvchad.configs.others").luasnip(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = require "configs.nvim_treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    opts = require "configs.nvim_treesitter_text_objects",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

      -- ; to jump to next text object move, , for prev
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- allow ; and , to also work for fF and tT of vim
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = require "configs.lspsaga",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    init = function()
      local dap, dapui = require "dap", require "dapui"
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
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.conform",
    config = function(_, opts)
      local conform = require "conform"
      conform.setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.nvimlint",
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = require "configs.rust-tools",
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "nvchad.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension "live_grep_args"
    end,
  },
  {
    "ellisonleao/glow.nvim",
    opts = require "configs.glow",
    ft = "markdown",
    config = function(_, opts)
      require("glow").setup(opts)
    end,
  },
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
  },
  -- {
  --     "vim-scripts/ReplaceWithRegister",
  --     event = { "BufReadPre", "BufNewFile" },
  --     -- use key gr<motion> to paste by replacing the thing selected by motion
  -- },
  -- {
  --     "mg979/vim-visual-multi",
  --     event = { "BufEnter" }
  -- },
  {
    "gcmt/wildfire.vim",
    event = { "BufReadPre" },
    -- press enter to keep expanding the smart selection. press backspace to
    -- decrease the selection (like a wildfire)
  },
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    opts = require "configs.autosave",
    config = function(_, opts)
      require("auto-save").setup(opts)
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    "echasnovski/mini.animate",
    opts = require "configs.mini_animate",
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
    version = false,
    lazy = false,
  },
  {
    "paramSonawane/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
    event = "LspAttach",
  },
  "akinsho/nvim-toggleterm.lua",
  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "Pioinit",
      "Piorun",
      "Piocmd",
      "Piolib",
      "Piomon",
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local venv_selector = require "venv-selector"
      venv_selector.setup {
        changed_venv_hooks = { venv_selector.hooks.pyright },
        notify_user_on_active = false,
        stay_on_this_version = true,
      }
    end,
  },
}

return Plugins
