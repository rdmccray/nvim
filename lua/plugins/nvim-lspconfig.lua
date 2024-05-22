return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "folke/neoconf.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },

    config = function()
        -- add diagnositc signs to the number column
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- setting up for configuring language servers
        require("neoconf").setup({})
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local lspconfig = require("lspconfig")

        local on_attach = function (_, _)
            keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
            keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
            keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
            keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
            keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
            keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
            keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
            keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
            keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
            keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
            keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
            keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
            keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
            keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
            keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")
        end,
        
        
        -- begin configuring language servers

        -- lua-language-server
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    },
                })
            end,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- typescript language server
        lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = {
                hostInfo = "neovim",
                preferences = {
                    disableSuggestions = true,
                },
            },
        })
    end,
}
