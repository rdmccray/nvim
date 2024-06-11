return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = {
            enabled = true,
        },
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
    },

    config = function()
        -- add diagnositc signs to the number column
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- keymaps to use in the buffer
        -- this has moved to the autocmds
        -- local on_attach = function(args)
        --     vim.keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = args.buf })
        --     vim.keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { buffer = args.buf })
        --     vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { buffer = args.buf })
        -- end

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- ****************************************
        -- ** begin configuring language servers **
        -- ****************************************
        -- these get passed in the lua_ls settings along with the ones below
        -- client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua

        -- lua-language-server
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
        -- https://luals.github.io/wiki/settings/

        lspconfig.lua_ls.setup({

            capabilities = lsp_capabilities,
            -- on_attach = on_attach, -- this has been moved to the autocmds

            settings = { -- custom settings for lua
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                        enable = true,
                    },
                    diagnostics = {
                        disable = {
                            "missing-fields",
                        },
                        -- make the language server recognize "vim" global
                        -- globals = { "vim" },
                    },
                    hint = {
                        enable = true,
                        semicolon = "Disable",
                    },
                    runtime = {
                        -- Tell the language server which version of Lua you're
                        -- using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        ignoreDir = { ".git" },
                        library = {
                            vim.env.VIMRUNTIME,
                            -- depending on the usage, you might
                            -- want to add additional paths here
                            -- "${3rd}/luv/library",
                            -- "${3rd}/busted/library",
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        },
                    },
                },
            },
        })
    end,
}
