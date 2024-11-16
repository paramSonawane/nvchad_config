local highlights = require "highlights"

local options = {

  base46 = {
    theme = "ashes", -- default theme
    hl_add = {},
    -- hl_override = {},
    hl_override = highlights.override,
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "onedark", "one_light" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      lspkind_text = true,
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = false, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
      overriden_modules = function(modules)
        -- modules[1] = (function()
        --    return "MODE!"
        -- end)()

        local actived_venv = function()
          local venv_name = require("venv-selector").get_active_venv()
          if venv_name ~= nil then
            -- replace the path if it is of poetry
            venv_name = string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "/(poetry) ")
            -- get the directory of the venv instead of entire path
            venv_name = string.match(venv_name, ".*/(.*)")
            return "  " .. venv_name .. " "
          else
            return ""
          end
        end
        table.insert(modules, 13, actived_venv())
      end,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      -- "                            ",
      -- "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
      -- "   ▄▀███▄     ▄██ █████▀    ",
      -- "   ██▄▀███▄   ███           ",
      -- "   ███  ▀███▄ ███           ",
      -- "   ███    ▀██ ███           ",
      -- "   ███      ▀ ███           ",
      -- "   ▀██ █████▄▀█▀▄██████▄    ",
      -- "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
      -- "                            ",
      "         Powered By        ",
      -- "                   eovim          ",
            "                                                                       ",
            "                                                                     ",
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
            "                                                                       ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
        only_current_line = true,
        highlight_whole_line = true,
    }
})

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Auto select virtualenv',
    pattern = '*',
    callback = function()
        local venv = (
            vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
            or vim.fn.findfile('Pipfile', vim.fn.getcwd() .. ';')
        )
        if venv then
            require('venv-selector').retrieve_from_cache()
        end
    end,
    once = true,
})

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
