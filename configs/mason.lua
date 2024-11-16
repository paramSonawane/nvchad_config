local mason_lsp = {
    'arduino_language_server',
    -- 'clangd',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'taplo',
    'ts_ls',
}

local mason_tools = {
    "clang-format",
    "codespell_columns",
    "eslint_d",
    "jsonlint",
    "js-debug-adapter",
    "jq",
    "markdownlint",
    "prettier",
    "isort",
    "ruff",
    "black",
    "debugpy",
    "mypy",
    "stylua",
}

local all_tools = {}

require("mapping_functions").table_merge(mason_lsp, mason_tools, all_tools)

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ensure_installed = all_tools,
            ui = {
                icons = {
                    package_uninstalled = ""
                }
            },
            registries = {
                "github:mason-org/mason-registry",
                "github:paramSonawane/mason-registry",
            },
        })

        mason_lspconfig.setup({
            ensure_installed = mason_lsp,
            automatic_installation = true,
            -- handlers = nil,
        })

        mason_tool_installer.setup({
            ensure_installed = mason_tools,
            run_on_start = true,
            start_delay = 2000
        })
    end,
    lazy = false
}
