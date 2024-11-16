local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.gopls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
--     root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             completeUnimported = true,
--             usePlaceholders = true,
--             analyses = {
--                 unusedparams = true
--             }
--         }
--     }
-- })

lspconfig.arduino_language_server.setup {
    on_attach = on_attach,
    capabilities = {
        general = {
            positionEncodings = { "utf-16" }
        },
        textDocument = {
            callHierarchy = {
                dynamicRegistration = false
            },
            codeAction = {
                codeActionLiteralSupport = {
                    codeActionKind = {
                        valueSet = { "", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
                    }
                },
                dataSupport = true,
                dynamicRegistration = true,
                isPreferredSupport = true,
                resolveSupport = {
                    properties = { "edit" }
                }
            },
            completion = {
                completionItem = {
                    commitCharactersSupport = false,
                    deprecatedSupport = false,
                    documentationFormat = { "markdown", "plaintext" },
                    preselectSupport = false,
                    snippetSupport = false
                },
                completionItemKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
                },
                completionList = {
                    itemDefaults = { "editRange", "insertTextFormat", "insertTextMode", "data" }
                },
                contextSupport = false,
                dynamicRegistration = false
            },
            declaration = {
                linkSupport = true
            },
            definition = {
                dynamicRegistration = true,
                linkSupport = true
            },
            diagnostic = {
                dynamicRegistration = false
            },
            documentHighlight = {
                dynamicRegistration = false
            },
            documentSymbol = {
                dynamicRegistration = false,
                hierarchicalDocumentSymbolSupport = true,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
                }
            },
            formatting = {
                dynamicRegistration = true
            },
            hover = {
                contentFormat = { "markdown", "plaintext" },
                dynamicRegistration = true
            },
            implementation = {
                linkSupport = true
            },
            inlayHint = {
                dynamicRegistration = true,
                resolveSupport = {
                    properties = { "textEdits", "tooltip", "location", "command" }
                }
            },
            publishDiagnostics = {
                dataSupport = true,
                relatedInformation = true,
                tagSupport = {
                    valueSet = { 1, 2 }
                }
            },
            rangeFormatting = {
                dynamicRegistration = true
            },
            references = {
                dynamicRegistration = false
            },
            rename = {
                dynamicRegistration = true,
                prepareSupport = true
            },
            semanticTokens = vim.NIL,
            signatureHelp = {
                dynamicRegistration = false,
                signatureInformation = {
                    activeParameterSupport = true,
                    documentationFormat = { "markdown", "plaintext" },
                    parameterInformation = {
                        labelOffsetSupport = true
                    }
                }
            },
            synchronization = {
                didSave = true,
                dynamicRegistration = false,
                willSave = true,
                willSaveWaitUntil = true
            },
            typeDefinition = {
                linkSupport = true
            }
        },
        window = {
            showDocument = {
                support = true
            },
            showMessage = {
                messageActionItem = {
                    additionalPropertiesSupport = false
                }
            },
            workDoneProgress = true
        },
        workspace = {
            applyEdit = true,
            configuration = true,
            didChangeConfiguration = {
                dynamicRegistration = false
            },
            didChangeWatchedFiles = {
                dynamicRegistration = true,
                relativePatternSupport = true
            },
            inlayHint = {
                refreshSupport = true
            },
            semanticTokens = vim.NIL,
            symbol = {
                dynamicRegistration = false,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
                }
            },
            workspaceEdit = {
                resourceOperations = { "rename", "create", "delete" }
            },
            workspaceFolders = true
        }
    },
    cmd = {
        "arduino-language-server",
        -- "-cli-config",
        -- "~/.arduino15/arduino-cli.yaml",
        -- "-fqbn",
        -- MY_FQBN
    },
    filetypes = { "arduino" }
}

lspconfig.clangd.setup {
    on_attach = function()
        print("clangd attached to the buffer")
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    end
}

lspconfig.ts_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        preferences = { disableSuggesstions = true, }
    }
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function()
        print("lua-lsp attached to the buffer")
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    end,
}

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" }
})
